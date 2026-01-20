module coins::regulated_coin;

use sui::coin_registry;
use sui::coin::{Self, DenyCapV2};
use sui::deny_list::DenyList;

// 1 billion -> 9 decimals
const TOTAL_SUPPLY: u64 = 1_000_000_000_000_000_000;

// otw
public struct REGULATED_COIN has drop{}

fun init(otw: REGULATED_COIN, ctx: &mut TxContext){
    let (mut builder, mut treasury_cap) = coin_registry::new_currency_with_otw(
        otw, 
        9, 
        b"REG".to_string(),
        b"My Rugulated Coin".to_string(), 
        b"Create My Regulated Coin".to_string(),
        b"https://i.ibb.co/7J6HbMgw/19023983-431a-4013-9333-22ee8ff92c48.jpg".to_string(), 
        ctx
    );

    let deny_cap = coin_registry::make_regulated(&mut builder, true, ctx);

    let metadata_cap = coin_registry::finalize(builder, ctx);

    let total_supply = coin::mint(&mut treasury_cap, TOTAL_SUPPLY, ctx);

    transfer::public_transfer(total_supply, ctx.sender());
    transfer::public_transfer(metadata_cap, ctx.sender());
    transfer::public_transfer(treasury_cap, ctx.sender());
    transfer::public_transfer(deny_cap, ctx.sender());
}

public fun add_to_deny_list(
    deny_list: &mut DenyList, 
    deny_cap: &mut DenyCapV2<REGULATED_COIN>, 
    addr: address,
    ctx: &mut TxContext
){
    coin::deny_list_v2_add<REGULATED_COIN>(deny_list, deny_cap, addr, ctx);
}

public fun remove_from_deny_list(
    deny_list: &mut DenyList, 
    deny_cap: &mut DenyCapV2<REGULATED_COIN>, 
    addr: address,
    ctx: &mut TxContext
){
    coin::deny_list_v2_remove(deny_list, deny_cap, addr, ctx);
}

public fun enable_global_pause(
    deny_list: &mut DenyList, 
    deny_cap: &mut DenyCapV2<REGULATED_COIN>, 
    ctx: &mut TxContext
){
    coin::deny_list_v2_enable_global_pause(deny_list, deny_cap, ctx);
}

public fun disable_global_pause(
    deny_list: &mut DenyList, 
    deny_cap: &mut DenyCapV2<REGULATED_COIN>, 
    ctx: &mut TxContext
){
    coin::deny_list_v2_disable_global_pause(deny_list, deny_cap, ctx);
}

public fun check_deny_list_current_epoch(
    deny_list: &DenyList, 
    addr: address,
    ctx: &TxContext
) : bool{
    coin::deny_list_v2_contains_current_epoch<REGULATED_COIN>(deny_list, addr, ctx)
}

public fun check_deny_list_next_epoch(
    deny_list: &DenyList, 
    addr: address
) : bool{
    coin::deny_list_v2_contains_next_epoch<REGULATED_COIN>(deny_list, addr)
}

public fun is_global_pause_enabled_current_epoch(
    deny_list: &DenyList, 
    ctx: &TxContext
) : bool{
    coin::deny_list_v2_is_global_pause_enabled_current_epoch<REGULATED_COIN>(deny_list, ctx)
}

public fun is_global_pause_enabled_next_epoch(
    deny_list: &DenyList,
) : bool{
    coin::deny_list_v2_is_global_pause_enabled_next_epoch<REGULATED_COIN>(deny_list)
}

// denylistCap --> 0x95f33c2312550902cb79abbf3e06ffdd3e54af8e089092177fe6fdea9a00adf1