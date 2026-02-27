module coins::fixed_coin;


use sui::coin_registry::{Self, Currency};
use sui::coin;

// 1 billion -> 9 decimals
const TOTAL_SUPPLY: u64 = 1_000_000_000_000_000_000;

// otw
public struct FIXED_COIN has drop{}

fun init(otw: FIXED_COIN, ctx: &mut TxContext){
    let (mut builder, mut treasury_cap) = coin_registry::new_currency_with_otw(
        otw, 
        9, 
        b"FIX".to_string(),
        b"My Fixed Coin".to_string(), 
        b"Create My Fixed Coin".to_string(),
        b"https://i.ibb.co/7J6HbMgw/19023983-431a-4013-9333-22ee8ff92c48.jpg".to_string(), 
        ctx
    );


    let total_supply = coin::mint(&mut treasury_cap, TOTAL_SUPPLY, ctx);

    coin_registry::make_supply_fixed_init(&mut builder, treasury_cap);

    let metadata_cap = coin_registry::finalize(builder, ctx);

    transfer::public_transfer(total_supply, ctx.sender());
    transfer::public_transfer(metadata_cap, ctx.sender());
}

public fun get_total_supply(currency: &Currency<FIXED_COIN>) : Option<u64>{
    coin_registry::total_supply(currency)
}

public fun is_supply_fix(currency: &Currency<FIXED_COIN>) : bool{
    currency.is_supply_fixed()
}