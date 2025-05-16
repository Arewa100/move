#[test_only]
#[allow(duplicate_alias)]
module bank::bank_test {

use std::string::String;
use sui::bcs::to_bytes;
use std::vector;
use std::debug;

public fun the_name(): String{
   let mut _name: String = b"Samuel".to_string();
   _name = b"Favor".to_string();
   debug::print<String>(&_name);
   _name
}


#[test]
fun checking_expressions() {
   let age: u16 = 33;
   let new_value: u8 = age as u8;
   assert!(new_value == 33, 0);
}


#[test]
fun testing_mutable_variable() {
assert!(the_name() == b"Favor".to_string(), 0);
}

#[test]
fun test_the_bool_data_type() {
   let first = true;
   let second = true;

   assert!(first && second == true, 0);
   assert!(first != second == false, 0);
   assert!(first || second == true, 0);
}

  public fun to_byte(the_address: address): vector<u8> {
      to_bytes(&the_address)
   }

#[test]
fun testing_the_address_data_type() {
   //address conversions
   let my_address: address = @0x1;  //creates a 32 bits wide value
   debug::print<address>(&my_address);
   // assert!(to_byte(my_address) != vector::empty(), 0); 
   // debug::print<address>(&my_address);
   let value:vector<u8> = to_byte(my_address);
   debug::print<vector<u8>>(&value);
   // assert!(to_byte(my_address).length() == 32, 0)
   
}

#[test]
fun test_to_create_vectors() {
   let list_of_names: vector<String> = vector[b"ola".to_string(), b"miracle".to_string(), b"ope".to_string()];
   debug::print<vector<String>(&list_of_names);
}
}