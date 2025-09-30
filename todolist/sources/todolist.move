// Fixed todolist module - completely clean imports
module todolist::todolist {
    use std::string::String;
    use sui::event;

    // Define the Task struct
    public struct Task has key, store {
        id: sui::object::UID,
        title: String,
        content: String,
        created_at: u64,
    }

    // Event for task creation
    public struct TaskCreationResponse has copy, drop {
        message: vector<u8>,
        task_id: address,
        timestamp: u64,
    }

    // TodoList struct to track the owner's todo list
    public struct TodoList has key {
        id: sui::object::UID,
        tasks_created: u64, // Fixed typo: was "task_created"
    }

    // Init function - runs once when module is deployed
    fun init(ctx: &mut sui::tx_context::TxContext) {
        let todo_list = TodoList {
            id: sui::object::new(ctx),
            tasks_created: 0,
        };

        // Transfer to the publisher (deployer) of the module
        sui::transfer::transfer(todo_list, sui::tx_context::sender(ctx));
    }
    
    // Add task function - now updates the TodoList counter
    public entry fun add_task(
        todo_list: &mut TodoList, // Take TodoList as parameter
        title: String, 
        content: String, 
        ctx: &mut sui::tx_context::TxContext
    ) {
        let task_id = sui::object::new(ctx);
        let task_address = sui::object::uid_to_address(&task_id);
        let current_time = sui::tx_context::epoch(ctx);

        let new_task = Task {
            id: task_id,
            title,
            content,
            created_at: current_time,
        };

        // Update the task counter
        todo_list.tasks_created = todo_list.tasks_created + 1;

        event::emit(TaskCreationResponse {
            message: b"task created successfully",
            task_id: task_address,
            timestamp: current_time,
        });

        // Transfer the task to the sender
        sui::transfer::public_transfer(new_task, sui::tx_context::sender(ctx));
    }

    // View functions for testing
    public fun get_task_info(task: &Task): (String, String, u64) {
        (task.title, task.content, task.created_at)
    }

    public fun get_task_id_address(task: &Task): address {
        sui::object::uid_to_address(&task.id)
    }

    public fun get_tasks_created(todo_list: &TodoList): u64 {
        todo_list.tasks_created
    }

    // Test-only initialization function
    #[test_only]
    public fun init_for_testing(ctx: &mut sui::tx_context::TxContext) {
        init(ctx);
    }
}