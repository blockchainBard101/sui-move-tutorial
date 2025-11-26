module coins::coins;
use sui::coin_registry::{Self, CoinRegistry, Currency};
use sui::coin::{Coin, TreasuryCap};

public struct MyCoin has key{
    id: UID
}

// 0.1 --> 10 -> decimals -> 1 -> 10^1
// 0.1 --> 100 -> decimals -> 2 -> 10^2

// 1 --> 9 decimal
// 1000000000 -> 1 SUI
// 100000000  -> 0.1 SUI

#[allow(lint(self_transfer))]
public fun create_coin(coin_registry: &mut CoinRegistry, ctx: &mut TxContext){
    let (coin_init, treasury_cap) = coin_registry::new_currency<MyCoin>(
        coin_registry, 
        9, 
        b"CON".to_string(),
        b"My Coin".to_string(), 
        b"Create My Coin".to_string(),
        b"https://i.ibb.co/7J6HbMgw/19023983-431a-4013-9333-22ee8ff92c48.jpg".to_string(), 
        ctx
    );
    
    // let total_suply = treasury_cap.mint(10000_000000000, ctx);
    let metadata_cap = coin_init.finalize(ctx);

    transfer::public_transfer(metadata_cap, ctx.sender());
    // transfer::public_transfer(total_suply, ctx.sender());
    transfer::public_transfer(treasury_cap, ctx.sender());
}

#[allow(lint(self_transfer))]
public fun mint(treasury_cap: &mut TreasuryCap<MyCoin>, amount: u64, ctx: &mut TxContext){
    let new_supply = treasury_cap.mint(amount, ctx);
    transfer::public_transfer(new_supply, ctx.sender());
}

// public fun burn(burn_coin: Coin<MyCoin>, currency: &mut Currency<MyCoin>){
//     currency.burn(burn_coin);
// }






























// https://i.ibb.co/7J6HbMgw/19023983-431a-4013-9333-22ee8ff92c48.jpg