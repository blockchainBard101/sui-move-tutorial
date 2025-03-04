module references::references;

public struct Account has drop{
    balance : u64,
}

public fun create_account(): Account{
    let account = Account{
        balance : 0
    };
    account
}

public fun get_balance(account : &Account) : u64{
    account.balance
}

public fun deposit(account: &mut Account, amount : u64){
    account.balance = amount;
}

public fun close_account(account: Account) : u64{
    let Account{ balance} = account;
    balance
}

public fun read_through_ref(balance_ref: &u64) : u64{
    *balance_ref
}

public fun write_through_ref(balance_ref: &mut u64, new_value:u64){
    *balance_ref = new_value
}

public fun add_mut_immut(a: &mut u64, b : &u64): u64{
    *a + *b
}

public fun takes_immutable(a : &u64): &u64{
    a
}

public fun takes_mutable(a : &mut u64) : &u64{
    a
}

// public fun takes_immutable_returns_mut(a : &u64) : &mut u64{
//     a
// }