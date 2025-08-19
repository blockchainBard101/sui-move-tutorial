module time::time;

use sui::clock::Clock;

public struct Vault<T> has key{
    id: UID,
    // lock_epoch: u64,
    unlock_time_ms: u64,
    lock_time_ms: u64,
    item: T
}

public fun create_vault<T: store>(item: T, unlock_time_ms: u64, clock: &Clock, ctx: &mut TxContext){
    let vault = Vault<T>{
        id: object::new(ctx),
        unlock_time_ms,
        lock_time_ms: clock.timestamp_ms(),
        item
    };
    
    transfer::transfer(vault, ctx.sender());
}


public fun destroy_vault<T: key + store>(vault: Vault<T>, clock: &Clock, ctx: &mut TxContext){
    assert!(clock.timestamp_ms() >= vault.unlock_time_ms);

    let Vault<T>{id, unlock_time_ms: _, lock_time_ms: _, item} = vault;

    id.delete();

    transfer::public_transfer(item, ctx.sender())
}

