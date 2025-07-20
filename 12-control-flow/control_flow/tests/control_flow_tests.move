#[test_only]
module control_flow::control_flow_tests;
// use control_flow::control_flow;
use std::debug;

#[test]
fun test_control_flow() {
    let max_count = 5;
    let mut count = 1;
    while(count <= max_count){
        if (count == 3){
            count = count + 1;
            continue
        };
        debug::print(&count);
        count = count + 1;
    }

    // loop{
    //     debug::print(&count);
    //     count = count + 1;
    //     if (count > max_count){
    //         break
    //     };
    // }   
}


