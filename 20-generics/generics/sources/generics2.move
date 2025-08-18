// module generics::gen2;
// public struct Coin<phantom Currency> has key, store{
//     id: UID,
//     value: u64,
// }

// public struct USD {}
// public struct EUR {}

// public fun mint_coin(v: u64, ctx: &mut TxContext) : Coin<USD>{
//     let coin = Coin<USD>{
//         id: object::new(ctx),
//         value: v
//     };
//     coin
// }

// public fun mint_coin<T>(clock: &USD){
// }