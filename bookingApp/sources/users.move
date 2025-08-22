module bookingapp::users;
use std::string::String;
use sui::object;
use sui::tx_context::TxContext;

public struct User has key, store {
    id: object::UID,
    name: String,
    email: String,
    password: String,
}

public entry fun Create_user(name: String, email: String, password: String, ctx: &mut TxContext): User {
    let user = User {

        id: object::new(ctx),
        name,
        email,
        password,
    }
    ussr
}