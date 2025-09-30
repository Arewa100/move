// Simplified working test module
#[test_only]
module todolist::todolist_tests {
    use sui::test_scenario as ts;
    use std::string;
    use todolist::todolist::{Self, Task, TodoList};

    const ADMIN: address = @0xAD;

    #[test]
    fun test_init_creates_todolist() {
        let mut scenario = ts::begin(ADMIN);
        
        // Initialize the module
        {
            todolist::init_for_testing(ts::ctx(&mut scenario));
        };

        // Check if TodoList was created
        ts::next_tx(&mut scenario, ADMIN);
        {
            assert!(ts::has_most_recent_for_sender<TodoList>(&scenario), 0);
            let todo_list = ts::take_from_sender<TodoList>(&scenario);
            let tasks_created = todolist::get_tasks_created(&todo_list);
            assert!(tasks_created == 0, 1);
            ts::return_to_sender(&scenario, todo_list);
        };

        ts::end(scenario);
    }

    #[test]
    fun test_add_task_basic() {
        let mut scenario = ts::begin(ADMIN);
        
        // Initialize the module
        {
            todolist::init_for_testing(ts::ctx(&mut scenario));
        };

        // Add a task
        ts::next_tx(&mut scenario, ADMIN);
        {
            let mut todo_list = ts::take_from_sender<TodoList>(&scenario);
            
            todolist::add_task(
                &mut todo_list,
                string::utf8(b"Test Task"),
                string::utf8(b"Test Content"),
                ts::ctx(&mut scenario)
            );
            
            // Verify counter updated
            let tasks_created = todolist::get_tasks_created(&todo_list);
            assert!(tasks_created == 1, 0);
            
            ts::return_to_sender(&scenario, todo_list);
        };

        // Verify task was created
        ts::next_tx(&mut scenario, ADMIN);
        {
            assert!(ts::has_most_recent_for_sender<Task>(&scenario), 1);
            let task = ts::take_from_sender<Task>(&scenario);
            let (title, content, created_at) = todolist::get_task_info(&task);
            
            assert!(title == string::utf8(b"Test Task"), 2);
            assert!(content == string::utf8(b"Test Content"), 3);
            assert!(created_at > 0, 4);
            
            ts::return_to_sender(&scenario, task);
        };

        ts::end(scenario);
    }

    #[test]  
    fun test_multiple_tasks() {
        let mut scenario = ts::begin(ADMIN);
        
        // Initialize
        {
            todolist::init_for_testing(ts::ctx(&mut scenario));
        };

        // Add first task
        ts::next_tx(&mut scenario, ADMIN);
        {
            let mut todo_list = ts::take_from_sender<TodoList>(&scenario);
            todolist::add_task(
                &mut todo_list,
                string::utf8(b"Task 1"),
                string::utf8(b"Content 1"),
                ts::ctx(&mut scenario)
            );
            ts::return_to_sender(&scenario, todo_list);
        };

        // Add second task  
        ts::next_tx(&mut scenario, ADMIN);
        {
            let mut todo_list = ts::take_from_sender<TodoList>(&scenario);
            todolist::add_task(
                &mut todo_list,
                string::utf8(b"Task 2"),
                string::utf8(b"Content 2"),
                ts::ctx(&mut scenario)
            );
            
            // Check counter is now 2
            let tasks_created = todolist::get_tasks_created(&todo_list);
            assert!(tasks_created == 2, 0);
            
            ts::return_to_sender(&scenario, todo_list);
        };

        ts::end(scenario);
    }
}