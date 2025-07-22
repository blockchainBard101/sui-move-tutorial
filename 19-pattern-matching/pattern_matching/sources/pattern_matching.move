module pattern_matching::pattern_matching;

use std::debug;
use std::string::{Self, String};

public enum Status {
    Active,
    Inactive,
    Banned(u64),
}

fun simple_matching(x: u64): u64 {
    let ans = match (x) {
        1 => 10,
        2 => 20,
        _ => 0,
    };
    ans
}

fun match_variable(x: u64): u64 {
    match (x) {
        y => y  +1,
    }
}

fun match_or(x: u64): String {
    match (x) {
        1 | 2 | 3 => b"Matched 1, 2, 3".to_string(),
        _ => b"Matched Something else".to_string(),
    }
}

fun enum_match(status: Status): String {
    match (status) {
        Status::Active => b"Welcome back!".to_string(),
        Status::Inactive => b"Account inactive".to_string(),
        Status::Banned(days) => {
            let num_str = (days as u8).to_string();
            let mut result = string::utf8(b"Banned for ");
            result.append(string::from_ascii(num_str.to_ascii()));
            result.append(string::utf8(b" days"));
            result
        },
    }
}

fun match_guard(x: u64) : String{
    match (x){
        n if (*n % 2 == 0) => b"Even number".to_string(),
        _ => b"odd number".to_string()
    }
}

#[test]
fun test_match_guard(){
    let result = match_guard(9);
    debug::print(&result);
}

#[test]
fun test_enum_match(){
    let result = enum_match(Status::Banned(7));
    debug::print(&result);
}

// #[test]
// fun test_simple_matching(){
//     let x = 1;
//     let ans = simple_matching(x);
//     debug::print(&ans);
// }

// #[test]
// fun test_variiable_matching(){
//     let x = 1;
//     let ans = match_variable(x);
//     debug::print(&ans);
// }

#[test]
fun test_or_matching() {
    let x = 10;
    let ans = match_or(x);
    debug::print(&ans);
}
