module constant::constant;

const MAX_NUMBER: u64 = 3;
const ADMIN: address = @0xa;

// const EEmptyBox: u64 = 2;
// const EMaxItem: u64 = 0;
// const ENotAdmin: u64 = 1;

#[error]
const EMaxItem: vector<u8> = b"Maxium Number of Item";

#[error]
const ENotAdmin: vector<u8> = b"Address Has no access";

#[error]
const EEmptyBox: vector<u8> = b"The Box is Empty";

public struct Item has key, store{
    id: UID
}

public struct Box has key, store{
    id: UID,
    items: vector<Item>
}

public fun create_box(ctx: &mut TxContext){
    let box = Box{
        id: object::new(ctx),
        items: vector::empty<Item>()
    };
    transfer::public_share_object(box);
}

public fun create_item(box: &mut Box, ctx: &mut TxContext){
    assert!(ctx.sender() == ADMIN, ENotAdmin);
    assert!(box.items.length() < MAX_NUMBER, EMaxItem);

    let item = Item{
        id: object::new(ctx)
    };
    box.items.push_back(item);
}

public fun get_item(box: &mut Box, ctx: &mut TxContext){
    assert!(box.items.length() > 0, EEmptyBox);
    let item = box.items.pop_back();
    transfer::public_transfer(item, ctx.sender());
}
