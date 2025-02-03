#[test_only]
module calculator::calculator_tests;
use std::debug;
use calculator::calculator;

#[test]
fun test_calculator() {
    let (add, subtract, multiply, divide ) = calculator::answer(8, 4);
    debug::print(&add);
    debug::print(&subtract);
    debug::print(&multiply);
    debug::print(&divide);
}
