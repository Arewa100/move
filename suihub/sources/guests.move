module suihub::guests;
use std::string::String

public struct Guest has key, store {
    id: UID,
    name: String,
    address: address,
    email: String,
    gender: String,
    completed: bool 
}

public fun SignIn( name: String, address: address, email: String, gender: String, completed: bool, ctx: &mut TxContext): Guest {

    let mut newGuest = Guest{
        id: object:new(ctx), //transaction context contains all information for the transaction 
        name, 
        address,
        email,
        gender,
        completed
    }

    guest
} //this is a public function

//***********************************************************************************************************************
//adding entry to it like below makes anyone else outside of this application 

// public fun SignIn( name: String, address: address, email: String, gender: String, completed: bool ): Guest {
//     let mut newGuest = Guest{
//         id: object:new(),
//         name, 
//         address,
//         email,
//         gender,
//         completed
//     };

//     guest
// } //this 

//************************************************************************************************************************
