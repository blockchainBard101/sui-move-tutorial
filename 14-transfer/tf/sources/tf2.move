module tf::tf2;

use tf::tf::{Self};

public fun transfer_obj_to_user(addr: address, ctx: &mut TxContext){
    let obj = tf::create_object(ctx);
    transfer::public_transfer(obj, addr); 
    // transfer::public_transfer(obj, addr);
}

public fun transfer_obj_to_public(ctx: &mut TxContext){
    let obj = tf::create_object(ctx);
    transfer::public_share_object(obj);
}

public fun freez_obj(ctx: &mut TxContext){
    let obj = tf::create_object(ctx);
    transfer::public_freeze_object(obj);
}

