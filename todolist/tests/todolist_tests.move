// Now the test module
#[test_only]
module todolist::todolist_tests {
    use sui::test_scenario::{Self as ts, Scenario};
    use sui::test_utils;
    use std::string;
    use todolist::todolist::{Self, Task};

    const USER: address = @0xA11CE;
    const USER2: address = @0xB0B;

    fun setup_test(): Scenario {
        let scenario = ts::begin(USER);
        scenario
    }

    #[test]
    fun test_add_task() {
        let mut scenario = setup_test();
        ts::next_tx(&mut scenario, USER);

        {
            // Create a task
            todolist::add_task(
                string::utf8(b"TESTING THE CHAIN"),
                string::utf8(b"i am testing the chain"),
                ts::ctx(&mut scenario)
            );
        };

        // Check if the task was created and transferred to the user
        ts::next_tx(&mut scenario, USER);
        {
            let task = ts::take_from_sender<Task>(&scenario);
            let (title, content, created_at) = todolist::get_task_info(&task);
            
            assert!(title == string::utf8(b"TESTING THE CHAIN"), 0);
            assert!(content == string::utf8(b"i am testing the chain"), 1);
            assert!(created_at > 0, 2); // Should have a timestamp
            
            ts::return_to_sender(&scenario, task);
        };

        ts::end(scenario);
    }

    // #[test]
    // fun test_multiple_tasks() {
    //     let mut scenario = setup_test();
    //     ts::next_tx(&mut scenario, USER);

    //     {
    //         // Create first task
    //         todolist::add_task(
    //             string::utf8(b"Task 1"),
    //             string::utf8(b"First task content"),
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         // Create second task
    //         todolist::add_task(
    //             string::utf8(b"Task 2"),
    //             string::utf8(b"Second task content"),
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     // Verify both tasks exist
    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         let task1 = ts::take_from_sender<Task>(&scenario);
    //         let task2 = ts::take_from_sender<Task>(&scenario);
            
    //         let (title1, content1, _) = todolist::get_task_info(&task1);
    //         let (title2, content2, _) = todolist::get_task_info(&task2);
            
    //         // Note: Order might be different, so we check both exist
    //         assert!(
    //             (title1 == string::utf8(b"Task 1") && title2 == string::utf8(b"Task 2")) ||
    //             (title1 == string::utf8(b"Task 2") && title2 == string::utf8(b"Task 1")),
    //             0
    //         );
            
    //         ts::return_to_sender(&scenario, task1);
    //         ts::return_to_sender(&scenario, task2);
    //     };

    //     ts::end(scenario);
    // }

    // #[test]
    // fun test_task_with_empty_content() {
    //     let mut scenario = setup_test();
    //     ts::next_tx(&mut scenario, USER);

    //     {
    //         todolist::add_task(
    //             string::utf8(b"Empty Content Task"),
    //             string::utf8(b""), // Empty content
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         let task = ts::take_from_sender<Task>(&scenario);
    //         let (title, content, _) = todolist::get_task_info(&task);
            
    //         assert!(title == string::utf8(b"Empty Content Task"), 0);
    //         assert!(content == string::utf8(b""), 1);
            
    //         ts::return_to_sender(&scenario, task);
    //     };

    //     ts::end(scenario);
    // }

    // #[test]
    // fun test_different_users_can_create_tasks() {
    //     let mut scenario = setup_test();
        
    //     // User 1 creates a task
    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         todolist::add_task(
    //             string::utf8(b"User 1 Task"),
    //             string::utf8(b"Task from user 1"),
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     // User 2 creates a task
    //     ts::next_tx(&mut scenario, USER2);
    //     {
    //         todolist::add_task(
    //             string::utf8(b"User 2 Task"),
    //             string::utf8(b"Task from user 2"),
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     // Verify User 1's task
    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         let task = ts::take_from_sender<Task>(&scenario);
    //         let (title, _, _) = todolist::get_task_info(&task);
    //         assert!(title == string::utf8(b"User 1 Task"), 0);
    //         ts::return_to_sender(&scenario, task);
    //     };

    //     // Verify User 2's task
    //     ts::next_tx(&mut scenario, USER2);
    //     {
    //         let task = ts::take_from_sender<Task>(&scenario);
    //         let (title, _, _) = todolist::get_task_info(&task);
    //         assert!(title == string::utf8(b"User 2 Task"), 1);
    //         ts::return_to_sender(&scenario, task);
    //     };

    //     ts::end(scenario);
    // }

    // #[test]
    // fun test_task_timestamps_are_different() {
    //     let mut scenario = setup_test();
        
    //     // Create first task
    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         todolist::add_task(
    //             string::utf8(b"First Task"),
    //             string::utf8(b"First task content"),
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     // Create second task in different transaction
    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         todolist::add_task(
    //             string::utf8(b"Second Task"),
    //             string::utf8(b"Second task content"),
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     // Check timestamps
    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         let task1 = ts::take_from_sender<Task>(&scenario);
    //         let task2 = ts::take_from_sender<Task>(&scenario);
            
    //         let (_, _, timestamp1) = todolist::get_task_info(&task1);
    //         let (_, _, timestamp2) = todolist::get_task_info(&task2);
            
    //         // Both should have valid timestamps
    //         assert!(timestamp1 > 0, 0);
    //         assert!(timestamp2 > 0, 1);
            
    //         ts::return_to_sender(&scenario, task1);
    //         ts::return_to_sender(&scenario, task2);
    //     };

    //     ts::end(scenario);
    // }

    // #[test]
    // fun test_long_title_and_content() {
    //     let mut scenario = setup_test();
    //     ts::next_tx(&mut scenario, USER);

    //     {
    //         let long_title = string::utf8(b"This is a very long title for a task that might contain a lot of information about what needs to be done");
    //         let long_content = string::utf8(b"This is a very long content description that provides detailed information about the task requirements, expectations, deadlines, and any other relevant details that might be needed for completion");
            
    //         todolist::add_task(
    //             long_title,
    //             long_content,
    //             ts::ctx(&mut scenario)
    //         );
    //     };

    //     ts::next_tx(&mut scenario, USER);
    //     {
    //         let task = ts::take_from_sender<Task>(&scenario);
    //         let (title, content, _) = todolist::get_task_info(&task);
            
    //         // Verify the long strings were stored correctly
    //         assert!(string::length(&title) > 50, 0);
    //         assert!(string::length(&content) > 100, 1);
            
    //         ts::return_to_sender(&scenario, task);
    //     };

    //     ts::end(scenario);
    // }
}