#[test_only]
module bank::bank_test {

use std::string::String;

public fun the_name(): String {
   let mut name: String = b"Samuel".to_string();
   name = b"Favor".to_string();
   name
  
}

#[test]
fun checking_expressions() {
   let age: u16 = 33;
   assert!(age == 33, 0);
}


#[test]
fun testing_mutable_variable() {
assert!(the_name() == b"Favor".to_string(), 0);
}

}