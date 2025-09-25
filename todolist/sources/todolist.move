module todolist::todolist {
use std::string::String;
use todolist::data::Task;
use sui::event;

public fun add_task(title: String, content: String, ctx: &mut sui::tx_context::TxContext) {
    let title = title;
    let content = content;
    let task_id = sui::object::new(ctx);
    let current_time = sui::tx_context::epoch(ctx);

    let newTask: Task = Task(task_id, title, content, current_time);

    event::emit(event: TaskCreationResponse {
        message: b"task created sucessfully"

    });
    
}

public struct TaskCreationResponse has copy, drop {
    message: String,
}

// public fun delete_task() {

// }

// public fun update_task() {

// }

// public fun read_task() {

// }
}