module enums::enums;
use std::string::String;

const STATUS_PENDING: u8 = 0;
const STATUS_SHIPPED: u8 = 1;
const STATUS_FAILED: u8 = 2;

public struct Order has key, store{
    id: UID,
    status: u8,
    owner: address,
    tracking: Option<String>,
    failure_reason: Option<String>,
    error_code: Option<u8>,
}

public fun create_order(owner: address, ctx: &mut TxContext){
    let order = Order{
        id: object::new(ctx),
        status: STATUS_PENDING,
        owner,
        tracking: option::none(),
        failure_reason: option::none(),
        error_code: option::none()
    };
    transfer::public_share_object(order);
}

public fun update_order_to_shipped(order: &mut Order){
    assert!(order.status == STATUS_PENDING, 0);
    order.status = STATUS_SHIPPED;
}

public fun update_status_to_failed(order: &mut Order, failure_reason: String, code: u8){
    assert!(order.status == STATUS_PENDING, 0);
    order.failure_reason = option::some(failure_reason);
    order.error_code = option::some(code);
    order.status = STATUS_FAILED
}