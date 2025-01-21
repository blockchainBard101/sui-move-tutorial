/// Module: variables_and_ptypes
module variables_and_ptypes::variables_and_ptypes;
use std::debug;

public fun main(){
    // bool --> true or false
    // u8 --> 8 bits
    //u16 --> 16 bits
    //u32, u64, u128, u256 bits

    // let a: u8  = 7;
    let a = 7u8;
    
    let _numA : u16  = 7u64; // wrong code
    let _numA : u16  = 7u16;

    let _num  = 7u64; 
    _num = 7 as u64; //wrong code

    let mut _num  = 7u64;
    _num = 7 as u64;

    let num1 : u8 = 8;
    let num2 : u16 = 600;

    let _add = num1 + num2 ;//error code

    let _add = (num1 as u16) + num2;

    let is_male : bool = true;

    debug::print(&is_male);
} 




