
#[test_only]
module references::references_tests;
// use references::references;
// use std::debug;

#[test]
fun test_references() {
    // let mut account = references::create_account();
    // debug::print(&account);
    // let balance = references::get_balance(&account);
    // debug::print(&balance);
    // // references::deposit(&mut account, 9);
    // debug::print(&account);

    let mut _a  = 0;
    _a = 8;

    let b : &u64 = &0;
    let c : &mut u64 = &mut 9;

    let mut x: &u64 = &0;
    let mut y : &mut u64 = &mut 7;

    x = &mut 9;
    // y = &5; //error
    assign_randmonly(x, c)
}

fun assign_randmonly(store: &mut u64, value: &u64){
    *store = *value
}
