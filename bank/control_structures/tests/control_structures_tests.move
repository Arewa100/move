#[test_only]
module control_structures::control_structures_tests {
    use std::debug;
    use std::string::String;

    #[test]
    fun test_single_selection_statement() {
        let age: u8 = 20;
        let height:u8 = 30;
        if(age < height) debug::print<String>(&b"age is lesser than height".to_string())
        else
        debug::print<String>(&b"age is greater than height".to_string());
        assert!(age < height == true, 0);
    }

    #[test]
    fun test_that_iteration() {
        let mut count = 1;
        while (count <= 10) {
            debug::print<u8>(&count);
            count = count + 1;
        }

    }

    
    #[test]
    fun test_to_veryify_structs() {

    }
}