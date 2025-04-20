module hello_world::hello_world;

use std::string::String;


//declaring variables

public fun print_value(): u16 {
    let mut _age: u16 = 20;
    _age = 100;
    _age
}

public fun expressing_casting(): u16 {
    let value: u8 = 12;
    let result: u16 = value as u16;
    result
}
public fun print_hello_world(): String {
    b"hello world".to_string()
}