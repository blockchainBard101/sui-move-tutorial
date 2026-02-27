module coins::burn_coin;

use sui::coin_registry::{Self, Currency};
use sui::coin::{Self, Coin};
use sui::balance::Balance;

// 1 billion -> 9 decimals
const TOTAL_SUPPLY: u64 = 1_000_000_000_000_000_000;

// otw
public struct BURN_COIN has drop{}

fun init(otw: BURN_COIN, ctx: &mut TxContext){
    let (mut builder, mut treasury_cap) = coin_registry::new_currency_with_otw(
        otw, 
        9, 
        b"BURN".to_string(),
        b"My BURN Coin".to_string(), 
        b"Create My Coin".to_string(),
        b"https://i.ibb.co/7J6HbMgw/19023983-431a-4013-9333-22ee8ff92c48.jpg".to_string(), 
        ctx
    );


    let total_supply = coin::mint(&mut treasury_cap, TOTAL_SUPPLY, ctx);

    coin_registry::make_supply_burn_only_init(&mut builder, treasury_cap);

    let metadata_cap = coin_registry::finalize(builder, ctx);


    transfer::public_transfer(total_supply, ctx.sender());
    transfer::public_transfer(metadata_cap, ctx.sender());
}

public fun burn_coin_via_currency(
    currency: &mut Currency<BURN_COIN>, 
    coin: Coin<BURN_COIN>
){
    currency.burn(coin);
}

public fun burn_balance_via_currency(
    currency: &mut Currency<BURN_COIN>, 
    balance: Balance<BURN_COIN>
){
    // coin_registry::burn_balance(currency, balance)
    currency.burn_balance(balance);
}

public fun is_supply_burn_only(currency: &Currency<BURN_COIN>): bool {
    currency.is_supply_burn_only()
}

public fun get_total_supply(currency: &Currency<BURN_COIN>) : Option<u64>{
    currency.total_supply()
}