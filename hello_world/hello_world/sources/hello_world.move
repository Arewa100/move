module hello_world::hello_world;

use std::string::String;

public fun print_hello_world(): String {
    b"hello world".to_string()
}