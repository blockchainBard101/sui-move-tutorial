module abt::abt;

public struct Counter has key {
    id: UID,
    admin: address,
    value: u64,
}

public fun create_counter(ctx: &mut TxContext) {
    let counter = Counter {
        id: object::new(ctx),
        admin: ctx.sender(),
        value: 10,
    };
    transfer::share_object(counter);
}

public fun increament_counter(counter: &mut Counter, ctx: &TxContext) {
    counter.value = counter.value + 1;
    assert!(counter.admin == ctx.sender(), 2) ;
    // if (counter.admin != ctx.sender()) { 
    //     abort 0
    // };
    counter.value = counter.value + 1; 
}
