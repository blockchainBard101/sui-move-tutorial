module publisher::publisher;

use sui::package::{Self, Publisher};
use std::string::String;

public struct PUBLISHER has drop{}

// 0xb9a0f7a93e655e0a95bb718e8a4f5050d4805e6447f8085d0df095bd7847a540

public struct Book has key{
    id: UID,
    title: String
}

fun init(otw: PUBLISHER, ctx: &mut TxContext){
    let publisher = package::claim(otw, ctx);

    transfer::public_transfer(publisher, ctx.sender());
}   


public fun admin_create_book(cap: &Publisher, title: String, ctx: &mut TxContext){
    // assert!(cap.from_module<Book>());
    // assert!(cap.from_package<Book>());
    let book = Book{
        id: object::new(ctx),
        title
    };
    transfer::share_object(book);
}
