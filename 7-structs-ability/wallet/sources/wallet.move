module wallet::wallet;
use std::string::String;

public struct Wallet has key{
    id: UID,
    owner_address: address,
    token: Token,
}

public struct Token has store, copy, drop{
    name: String,
    balance:  u64
}

public fun create_wallet(ctx: &mut TxContext){
    let wallet = Wallet{
        id: object::new(ctx),
        owner_address: ctx.sender(),
        token: Token{
            name: b"My Token".to_string(),
            balance:  0
        }
    };
    transfer::transfer(wallet, ctx.sender());
}

public fun deposit(wallet: &mut Wallet, amount : u64){
    wallet.token.balance = wallet.token.balance + amount;
}

public fun withdraw(wallet: &mut Wallet, amount: u64){
    wallet.token.balance = wallet.token.balance - amount;
}

public fun get_token(wallet : &Wallet) : Token{
    return wallet.token
}

public fun get_balance(wallet : &Wallet) : u64{
    return wallet.token.balance
}

public fun delete_wallet(wallet: Wallet){
    let Wallet {id, owner_address: _, token: _} = wallet;
    id.delete();
}