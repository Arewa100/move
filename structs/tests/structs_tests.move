#[test_only]
module structs::structs_tests {
use std::string::String;
use std::vector;

    public struct User has drop {
        name: String,
        age: u8,
        user_address: String,
    }

    #[test]
    fun test_to_create_a_new_user() {
        let user = User {
            name: b"Olasoyin Miracle".to_string(),
            age: 26,
            user_address: b"Yaba 23".to_string(),
        };

        assert!(user.name == b"Olasoyin Miracle".to_string(), 0);
    }

    #[test]
    fun test_to_create_list_of_users_using_vectors() {
        let first_user = User {
            name: b"Olasoyin Miracle".to_string(),
            age: 26,
            user_address: b"Yaba 23".to_string(),
        };

        let user_two = User {
            name: b"Eri".to_string(),
            age: 18,
            user_address: b"Yaba 23".to_string(),
        };

        let third_user = User {
            name: b"Joseph".to_string(),
            age: 21,
            user_address: b"Yaba 23".to_string(),
        };

        let list_of_users: vector<User> = vector[first_user, user_two, third_user];
        assert!(list_of_users[0].name == b"Olasoyin Miracle".to_string())
    }
}