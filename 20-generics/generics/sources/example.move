module generics::wallet;

public struct Coin<phantom Currency> has key, store {
    id: UID,
    value: u64,
}

public struct USD {}
public struct EUR {}

public struct Wallet<phantom Currency> has key, store {
    id: UID,
    coins: vector<Coin<Currency>>,
}

public fun mint_coin<Currency>(value: u64, ctx: &mut TxContext) : Coin<Currency> {
    let coin = Coin<Currency> {
        id: object::new(ctx),
        value,
    };
    coin
}

public fun create_wallet<Currency>(ctx: &mut TxContext) : Wallet<Currency> {
    let wallet = Wallet<Currency>{
        id: object::new(ctx),
        coins: vector::empty(),
    };
    wallet
}

public fun deposit<Currency>(wallet: &mut Wallet<Currency>, coin: Coin<Currency>){
    wallet.coins.push_back(coin);
}


// sui client ptb --move-call $PACKAGE_ID::wallet::mint_coin "<$PACKAGE_ID::wallet::USD>" 100
// 0 --assign coin --move-call $PACKAGE_ID::wallet::create_wallet "<$PACKAGE_ID::wallet::USD>" --assign wallet --mo
// ve-call $PACKAGE_ID::wallet::deposit "<$PACKAGE_ID::wallet::USD>" wallet coin --transfer-objects "[wallet]" @0x1
// 068052063d300712557f8ff76e9dc464a57f122e956d0934b0080f1fe9bf226
