module ctx::ctx;

public struct MyObject has key{
    id: UID,
    addr: address,
    epoch: u64,
    epoch_timestamp_ms: u64,
}

public fun create_object(ctx: &mut TxContext){
    let my_object = MyObject{
        id: object::new(ctx),
        addr: ctx.sender(),
        epoch: ctx.epoch(),
        epoch_timestamp_ms: ctx.epoch_timestamp_ms()
    };
    transfer::share_object(my_object);
}