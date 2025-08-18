// module generics::generics;

// use std::string::String;

// // fun identity_bool(x: bool) : bool{
// //     // do any thing
// //     x
// // }

// // fun identity_u64(x: u64) : u64{
// //     // do any thing
// //     x
// // }

// // fun identity_u8(x: u8) : u8{
// //     // do any thing
// //     x
// // }

// // fun identify<T, V>(x: T, y: V) : (T, V){
// //     (x, y)
// // }

// // fun identify_2<T>(x: T) : T{
// //     x
// // }



// // #[test]
// // fun test_identity(){
// //     let x = identify_2<u64>(2);
// //     let (x, y) = identify<bool, String>(true, b"Hello".to_string());
// // }

// public struct ContainerU64 has key{
//     id: UID,
//     value: u64
// }

// public struct ContainerBool has key{
//     id: UID,
//     value: bool
// }

// public struct Containter<T: key + store> has key{
//     id: UID,
//     value: T
// }

// public struct Pair<T1, T2> has key{
//     id: UID,
//     first: T1, //false, any 
//     second: T2 // u64, any
// }

// // public struct C has key{
// //     id: UID,
// //     value: D
// // }

// public struct Data has key, store{
//     id: UID
// }
 
// public fun create_container_u64(ctx: &mut TxContext, value: u64){
//     let container = ContainerU64{
//         id: object::new(ctx),
//         value
//     };
//     transfer::share_object(container);
// }

// public fun create_container<T: key + store >(ctx: &mut TxContext, value: T){
//     let container = Containter<T>{
//         id: object::new(ctx),
//         value
//     };
//     transfer::share_object(container);
// }

// public fun create_pair<T1, T2>(ctx: &mut TxContext, first: T1, second: T2) : Pair<T1, T2>{
//     let pair = Pair<T1, T2>{
//         id: object::new(ctx),
//         first,
//         second
//     };
//     pair
// }

// // #[test]
// // fun test_generic(){
// //     let mut tx = tx_context::dummy();
// //     let d = Data{
// //         id: object::new(&mut tx)
// //     };
// //     create_container<Data>(&mut tx, d);

// //     let pair = create_pair(&mut tx, false, 8);
// // }