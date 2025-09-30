#[test_only]
module control_statements::control_statements_tests {

    #[test]
    fun test_if_statment() {
        let first_number: u64 = 11;

        if(first_number > 10) {
            std::debug::print(&b"first number greater than 10".to_string());
        };

        assert!(first_number == 11, 0);
    }

    #[test]
    fun test_if_else_statement() {
        let number_one: u64 = 10;
        if(number_one == 11) {
            std::debug::print(&b"this is the first part".to_string());
        }else {
            std::debug::print(&b"this is the other part".to_string());
        };
    }

    #[test]
    fun test_that_iterations() {
        let mut count: u8 = 1;
        while(count <= 10) {
            std::debug::print(&count);
            count = count + 1;
        };
        //assert!(count == 10, 0);

    }


    #[test]
    fun test_vectors() {
        let new_vector: vector<u8> = vector[4, 5, 6];
        assert!(new_vector.length() == 3);
    }
}