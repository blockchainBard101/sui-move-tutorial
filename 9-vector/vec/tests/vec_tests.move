#[test_only]
module vec::vec_tests;
// use vec::vec;

// use std::vector;
use std::debug;

#[test]
fun test_vec() {
    let mut numbers = vector::empty<u64>();
    debug::print(&numbers.is_empty());
    debug::print(&numbers);
    vector::push_back(&mut numbers, 75);
    debug::print(&numbers);
    numbers.push_back(20);
    debug::print(&numbers);
    // let numbers_length = vector::length(&numbers);
    let numbers_length = numbers.length();
    debug::print(&numbers_length);
    debug::print(numbers.borrow(0));

    // let last_number =  numbers.pop_back();
    // debug::print(&numbers);
    // debug::print(&last_number);

    // debug::print(&numbers.remove(0));
    // debug::print(&numbers);

    // debug::print(&numbers.is_empty());
    numbers.insert(33, 1);
    debug::print(&numbers);

    numbers.swap(0, 1);
    debug::print(&numbers);

    // debug::print(&numbers.contains(&20));
    // debug::print(&numbers.contains(&100));
    numbers.push_back(100);
    debug::print(&numbers);
    numbers.reverse();
    debug::print(&numbers);
}

