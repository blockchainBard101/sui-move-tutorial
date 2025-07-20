module tf::tf;

// transfer::share_object()
// transfer::transfer

public struct MyObject has key, store{
    id: UID,
    value: u64
}

public fun create_object(ctx: &mut TxContext) : MyObject {
    let obj = MyObject{
        id: object::new(ctx),
        value: 0
    };
    obj
}

// public fun transfer_obj_to_user(addr: address, ctx: &mut TxContext){
//     let obj = create_object(ctx);
//     transfer::transfer(obj, addr);
//     // transfer::public_transfer(obj, addr);
// }

// public fun transfer_obj_to_public(ctx: &mut TxContext){
//     let obj = create_object(ctx);
//     transfer::share_object(obj);
// }

// public fun freez_obj(ctx: &mut TxContext){
//     let obj = create_object(ctx);
//     transfer::freeze_object(obj);
// }

// public fun change_value(obj: &mut MyObject, value: u64){
//     obj.value = value;
// }