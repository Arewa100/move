#[test_only]
module move_expressions::move_expressions_tests;
use move_expressions::move_expressions;

    #[test]
    fun test_that_it_works() {
        assert!(move_expressions::print_name() == b"Miracle".to_string());
    }
