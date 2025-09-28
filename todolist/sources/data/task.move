// module todolist::data {
//     use std::string::String;
//     use sui::object::{Self, UID};
//     use sui::tx_context::{Self, TxContext};
//     use sui::event;
//     use sui::transfer;

//     public struct Task has key, store {
//         id: UID,
//         title: String,
//         content: String,
//         time_of_creation: u64,
//     }


//     public struct TaskCreationResponse has copy , drop {
//         message: vector<u8>,
//         task_address: address,
//         timestamp: u64,
//     }

//     public fun add_task(title: String, content: String, ctx: &mut TxContext) {
//         let task_id = object::new(ctx);
//         let current_time = tx_context::epoch(ctx);
//         let task_address = object::uid_to_address(&task_id);

//         let new_task: Task = Task {
//             id:task_id,
//             title,
//             content ,
//             time_of_creation :current_time
//         }

//         event.emit(TaskCreationResponse{
//             message:  b"WELCOME",
//             task_address,
//             timestamp :current_time
//         });

//         transfer::public_transfer(new_task, tx_context::sender(ctx));
//     }
// }