module coin_balance::coin_balance;

use sui::balance::{Self, Balance};
use sui::coin::{Coin};
use sui::token;
public struct Vault<phantom C> has key, store{
    id: UID,
    balance: Balance<C>,
    owner: address
}

#[allow(lint(self_transfer))]
public fun create_vault<C>(ctx: &mut TxContext){
    let vault = Vault<C>{
        id: object::new(ctx),
        balance: balance::zero<C>(),
        owner: ctx.sender() 
    };
    transfer::public_transfer(vault, ctx.sender());
}   

public fun deposit<C>(vault: &mut Vault<C>, coin: Coin<C>){

    let coin_bal = coin.into_balance();

    // balance::join(&mut vault.balance, coin_bal);

    vault.balance.join(coin_bal);
}


#[allow(lint(self_transfer))]
public fun withdraw<C>(vault: &mut Vault<C>, amount: u64, ctx: &mut TxContext){
    // let new_balance = balance::split( &mut vault.balance, amount);

    let new_balance = vault.balance.split(amount);
    // let new_coin = coin::from_balance<SUI>(new_balance, ctx);

    let new_coin =  new_balance.into_coin(ctx);

    transfer::public_transfer(new_coin, ctx.sender());
}

#[allow(lint(self_transfer))]
public fun withdraw_all<C>(vault: &mut Vault<C>, ctx: &mut TxContext){
    // let new_balance = balance::withdraw_all(&mut vault.balance);

    let new_balance = vault.balance.withdraw_all();

    let new_coin =  new_balance.into_coin(ctx);

    transfer::public_transfer(new_coin, ctx.sender());
}

public fun destroy_zero<C>(vault: Vault<C>){
    let Vault {id, balance, owner: _} = vault;
    id.delete();

    balance::destroy_zero(balance);
}

public fun get_total_amount<C>(vault: &Vault<C>) : u64{
    // balance::value(&vault.balance)
    vault.balance.value()
}