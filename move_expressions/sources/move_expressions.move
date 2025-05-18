module move_expressions::move_expressions {
use std::string::String;




public fun print_name(): String {
    b"Miracle".to_string()
}















// public struct User has drop, copy, store{
//     name: String,
//     age: u16,
// }


// public fun create_user(user_name: String, user_age: u16): User{
//     User{name: user_name, age: user_age}
// }

// #[test] 
// fun test_that_the_struct_is_working() {
//     assert!(create_user(b"Miracle".to_string(), 20).name == b"Miracle".to_string(), 0)
// }

// #[test] 
// fun test_that_the_struct_is_working() {
//     let new_user = create_user(b"Miracle".to_string());
//     let User{name} = new_user;
//     assert!(name == b"Miracle".to_string(), 0)
// }

}