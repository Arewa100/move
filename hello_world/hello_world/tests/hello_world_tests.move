#[test_only]
module hello_world::hello_world_tests;

use hello_world::hello_world;

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