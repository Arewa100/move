#[test_only]
module hello_world::hello_world_tests;

use hello_world::hello_world;

#[test]
fun test_to_print_hello_world() {
    assert!(hello_world::print_hello_world() == b"hello world".to_string(), 0)
}