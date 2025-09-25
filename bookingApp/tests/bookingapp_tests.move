#[test_only]
module bookingapp::bookingapp_tests;
use std::string::String;
use bookingapp::bookingapp;

// #[tests] 
// fun test_create_user() {
//     let ctx = @test_ctx;
//     let user = Create_user("name", "email", "password", ctx);
// }

#[tests]
fun test_hello_world() {
    assert!(bookingapp::hello_world() == b"hello Miracle".to_string(), 0);
}

#[tests]
fun test_the_following_result() {
    let first: u8 = 12;
    let second: u8 = 20;
    assert!(first + second == 32)
}

#[tests]
public fun testing_something() {
    let mut color: String = b"Yellow".to_string();
    color = b"Red".to_string();
    assert!(color == b"Yellow".to_string(), 0);
}

#[tests]
public fun testing_overflow_and_underflow() {
    let firstNumber: u8 = 255;
    let secondNumber: u8 = 1;

    let result = firstNumber + secondNumber;

    assert!(result == 0, 0);
}