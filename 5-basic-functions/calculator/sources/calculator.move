/// Module: calculator
module calculator::calculator;

fun add(a: u8, b: u8) : u32{
    let ans = a +  b;
    ans as u32
}

fun subtract(a: u8, b: u8): u32{
    let ans = a -  b;
    return ans as u32

}

fun multiply(a: u8, b: u8): u32{
    let ans = a *  b;
    return ans as u32

}

fun divide(a: u8, b: u8): u32{
    let ans = a /  b;
    return ans as u32

}

public fun answer(a: u16, b : u16): (u64, u64, u64, u64){
    let a1 =  a as u8;
    let b1 = b as u8;
    let add = add(a1, b1) as u64;
    let subtract =  subtract(a1, b1) as u64 ;
    let multiply = multiply(a1, b1);
    let divide = divide(a1, b1);
    (add, subtract, multiply as u64, divide as u64)
}