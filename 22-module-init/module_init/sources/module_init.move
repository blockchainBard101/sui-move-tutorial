module module_init::module_init;

public struct Shop has key{
    id: UID
}

fun init(ctx: &mut TxContext){
    let shop = Shop{
        id: object::new(ctx)
    };

    transfer::share_object(shop);
} 
