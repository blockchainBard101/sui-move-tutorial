module type_reflection::type_reflection;

use std::type_name::{Self, TypeName};
use std::ascii::String;
use std::debug;

public fun do_i_know_you<T>(): (String, String, String) {
    let type_name: TypeName = type_name::get<T>();
    
    // there's a way to borrow
    let str: &String = type_name.borrow_string();

    let module_name: String = type_name.get_module();
    let address_str: String = type_name.get_address();

    // and a way to consume the value
    let str = type_name.into_string();

    (str, module_name, address_str)
}

#[test_only]
public struct MyType {}

#[test]
fun test_type_reflection() {
    let (type_name, module_name, address_str) = do_i_know_you<MyType>();
    debug::print(&type_name);
    debug::print(&module_name);
    debug::print(&address_str);

    //
    // assert!(module_name == b"type_reflection".to_ascii_string());
}