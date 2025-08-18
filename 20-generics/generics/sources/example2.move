module generics::vault;

public struct Vault<T> has key, store{
    id: UID,
    item: T
}

#[allow(lint(self_transfer))]
public fun create_valut<T: store>(item: T, ctx: &mut TxContext){
    let vault = Vault<T>{
        id: object::new(ctx),
        item
    };
    transfer::public_transfer(vault, ctx.sender())
}

public fun destroy_vault<T: key + store>(vault: Vault<T>, ctx: &mut TxContext){
    let Vault {id, item} = vault;

    id.delete();
    transfer::public_transfer(item, ctx.sender());
}