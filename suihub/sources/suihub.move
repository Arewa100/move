module suihub::suihub;
use std::string::String


public struct Suihub has key, store {
    id: UID,
    location: String,
    capacity: u64,
    staffs: u8,
}


public struct MemeCoin has key, store {
    id: UID,
    name: String,
    ticker: String,
    total_supply: u64,
    description: String,
    icon: String
}

