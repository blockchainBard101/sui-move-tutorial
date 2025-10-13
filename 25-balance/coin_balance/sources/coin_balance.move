module coin_balance::coin_balance;

use sui::balance::{Self, Balance};
use sui::sui::SUI;
use sui::coin::{Self, Coin};

public struct Vault has key, store{
    id: UID,
    balance: Balance<SUI>,
    owner: address
}

#[allow(lint(self_transfer))]
public fun create_vault(ctx: &mut TxContext){
    let vault = Vault {
        id: object::new(ctx),
        balance: balance::zero<SUI>(),
        owner: ctx.sender() 
    };
    transfer::public_transfer(vault, ctx.sender());
}   

public fun deposit(vault: &mut Vault, coin: Coin<SUI>){

    let coin_bal = coin.into_balance();

    // balance::join(&mut vault.balance, coin_bal);

    vault.balance.join(coin_bal);
}


#[allow(lint(self_transfer))]
public fun withdraw(vault: &mut Vault, amount: u64, ctx: &mut TxContext){
    // let new_balance = balance::split( &mut vault.balance, amount);

    let new_balance = vault.balance.split(amount);
    // let new_coin = coin::from_balance<SUI>(new_balance, ctx);

    let new_coin =  new_balance.into_coin(ctx);

    transfer::public_transfer(new_coin, ctx.sender());
}

#[allow(lint(self_transfer))]
public fun withdraw_all(vault: &mut Vault, ctx: &mut TxContext){
    // let new_balance = balance::withdraw_all(&mut vault.balance);

    let new_balance = vault.balance.withdraw_all();

    let new_coin =  new_balance.into_coin(ctx);

    transfer::public_transfer(new_coin, ctx.sender());
}

public fun destroy_zero(vault: Vault){
    let Vault {id, balance, owner: _} = vault;
    id.delete();

    balance::destroy_zero(balance);
}

public fun get_total_amount(vault: &Vault) : u64{
    // balance::value(&vault.balance)
    vault.balance.value()
}