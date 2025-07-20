module options::options;

use std::string::String;

public struct User has key {
    id: UID,
    first_name: String,
    middle_name: Option<String>,
    last_name: String,
}

public fun create_user(
    first_name: String,
    middle_name: Option<String>,
    last_name: String,
    ctx: &mut TxContext
){
    let user = User { id: object::new(ctx),first_name, middle_name, last_name };
    transfer::transfer(user, ctx.sender())
}

public fun update_missing_middle_name(user: &mut User, name: String){
    assert!(option::is_none(&user.middle_name));
    let option_name = option::some(name);
    user.middle_name = option_name;
}

public fun change_middle_name(user: &mut User, name: String){
    assert!(option::is_some(&user.middle_name));
    let option_name = option::some(name);
    user.middle_name = option_name;
}

public fun remove_middle_name(user: &mut User) : String{
    let old_middlename = option::extract(&mut user.middle_name);
    old_middlename
}

public fun get_middlename(user: &mut User) : String{
    let middle_name = option::borrow(&user.middle_name);
    *middle_name
}









































public struct Game has drop {
    name: String,
    winner: address
}

