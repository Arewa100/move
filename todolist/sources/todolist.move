// First, let's fix your main todolist module
module todolist::todolist {
    use std::string::String;
    use sui::event;
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    // Define the Task struct
    public struct Task has key, store {
        id: UID,
        title: String,
        content: String,
        created_at: u64,
    }

    // Event for task creation
    public struct TaskCreationResponse has copy, drop {
        message: vector<u8>, // Changed from String to vector<u8> to match your emit
        task_id: address,
        timestamp: u64,
    }

    // Add task function
    public entry fun add_task(title: String, content: String, ctx: &mut TxContext) {
        let task_id = object::new(ctx);
        let task_address = object::uid_to_address(&task_id);
        let current_time = tx_context::epoch(ctx);

        let new_task = Task {
            id: task_id,
            title,
            content,
            created_at: current_time,
        };

        event::emit(TaskCreationResponse {
            message: b"task created successfully",
            task_id: task_address,
            timestamp: current_time,
        });

        // Transfer the task to the sender
        transfer::public_transfer(new_task, tx_context::sender(ctx));
    }

    // View functions for testing
    public fun get_task_info(task: &Task): (String, String, u64) {
        (task.title, task.content, task.created_at)
    }

    public fun get_task_id_address(task: &Task): address {
        object::uid_to_address(&task.id)
    }

    // Test-only initialization function (if needed for platform setup)
    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        // Initialize any platform-specific objects if needed
        // For now, this todolist doesn't need platform initialization
    }
}

