#[test_only]
module structs::structs_tests;
use structs::structs;
use std::debug;

#[test]
fun test_structs() {
    let student = structs::create_student(16, true, 76, 55);
    let (age, _is_male, _math, _eng) = structs::get_student(student);

    debug::print(&age);

    let points = structs::create_cord();
    let (x, y, z) =  structs::get_cord(points);
    debug::print(&x);
    debug::print(&y);
    debug::print(&z);
}
