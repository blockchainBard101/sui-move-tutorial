module module_init::module_init;

public struct MODULE_INIT has drop {}

public struct Shop has key{
    id: UID
}

fun init(otw: MODULE_INIT, ctx: &mut TxContext){
    let shop = Shop{
        id: object::new(ctx)
    };

    transfer::share_object(shop);
} 
