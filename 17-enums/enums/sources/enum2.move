module enums::enums2;
use std::string::String;

public enum OrderStaus has store, drop, copy{
    Pending,
    shipped(String),
    failed{
        reason: String,
        code: u8
    }
}

public struct Order has key, store{
    id: UID,
    status: OrderStaus,
    owner: address,
}

public fun create_order(owner: address, ctx: &mut TxContext){
    let order = Order{
        id: object::new(ctx),
        status: OrderStaus::Pending,
        owner,
    };
    transfer::public_share_object(order);
}

public fun update_order_to_shipped(order: &mut Order, tracking: String){
    assert!(order.status == OrderStaus::Pending, 0);
    order.status = OrderStaus::shipped(tracking);
}

public fun update_status_to_failed(order: &mut Order, failure_reason: String, code: u8){
    assert!(order.status == OrderStaus::Pending, 0);
    order.status = OrderStaus::failed {reason: failure_reason, code};
}