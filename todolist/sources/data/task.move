module todolist::data {
    use std::string::String;
    use sui::object::UID;

    public struct Task has key, store {
        id: UID,
        title: String,
        content: String,
        time_of_creation: u64,
    }
}