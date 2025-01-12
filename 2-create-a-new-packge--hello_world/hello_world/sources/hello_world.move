module hello_world::hello_world;

use std::string::String;

public fun hello() : String{
    b"Hello World".to_string()
} 