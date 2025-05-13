#[test_only]
module hello_world::hello_world_tests;

use hello_world::hello_world;

use std::string::String;

#[test]
fun test_to_print_hello_world() {
    assert!(hello_world::print_hello_world() == b"hello world".to_string(), 0)
}

#[test]
fun test_to_print_value() {
    assert!(hello_world::print_value() == 100, 0)
}

#[test]
fun test_that_casting_works() {
    assert!(hello_world::expressing_casting() == 12, 0)
}

public fun compare(first: u16, second: u16): String {
    if(first > second) b"first is greater than second".to_string() 
    else b"second is greater".to_string()
}

#[test]
fun test_to_compare_two_number() {
    assert!(compare(8, 4) == b"first is greater than second".to_string(), 0)
}

#[test]
fun test_loop() {
    let mut count: u16 = 0;
    while (count <= 10) {
        b"working".to_string();
        count = count + 1;
    }

    assert!(count == 0, 0);
}


// public let sum: u8 = {
//     let first_number: u8 = 1;
//     let second_number: u8 = 2;
//     first_number + second_number
// }


// #[test] 
// fun test_the_above_expression() {
//     assert!(sum == 3, 0)
// }