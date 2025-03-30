module vec::vec;
use std::string::String;

public struct Apple has store{
    color: String,
    size: u64,
}

public struct Fruits has key{
    id: UID,
    fruits: vector<Apple>,
}

fun init(ctx: &mut TxContext) {
    let fruits = Fruits{
        id: object::new(ctx),
        fruits: vector::empty<Apple>()
    };
    transfer::share_object(fruits);
} 
