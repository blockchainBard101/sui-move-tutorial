module coins::coin_otw;

use sui::coin_registry;
use sui::coin;

// 1 billion -> 9 decimals
const TOTAL_SUPPLY: u64 = 1_000_000_000_000_000_000;

// otw
public struct COIN_OTW has drop{}

fun init(otw: COIN_OTW, ctx: &mut TxContext){
    let (builder, mut treasury_cap) = coin_registry::new_currency_with_otw(
        otw, 
        9, 
        b"CON".to_string(),
        b"My Coin".to_string(), 
        b"Create My Coin".to_string(),
        b"https://i.ibb.co/7J6HbMgw/19023983-431a-4013-9333-22ee8ff92c48.jpg".to_string(), 
        ctx
    );

    let metadata_cap = coin_registry::finalize(builder, ctx);

    let total_supply = coin::mint(&mut treasury_cap, TOTAL_SUPPLY, ctx);

    transfer::public_transfer(total_supply, ctx.sender());
    transfer::public_transfer(metadata_cap, ctx.sender());
    transfer::public_transfer(treasury_cap, ctx.sender());
}