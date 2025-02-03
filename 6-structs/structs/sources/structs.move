/// Module: structs
module structs::structs;
use std::debug;

public struct MyStruct{}

public struct Student{
    age: u8,
    isMale: bool,
    grades : Grades,
}

public struct Grades{
    math: u16,
    eng: u16,
}

public fun create_student(student_age : u8, is_male : bool, math : u16, eng : u16) : Student{
    // let student1 : Student = Student{
    //     age : student_age,
    //     isMale : is_male,
    //     grades : Grades{
    //         math: math,
    //         eng: eng,
    //     }
    // };

    let grades : Grades = Grades{
        math,
        eng,
    };
    let student = Student{
        age: student_age,
        isMale : is_male,
        grades
    };

    student
}

public fun get_student(student: Student) : (u8, bool, u16, u16){
    let age = student.age;
    let is_male = student.isMale;

    debug::print(&age);
    debug::print(&is_male);

    // let Student{age , isMale, grades} = student;
    let Student{age , isMale, grades : Grades{math, eng }} = student;

    (age, isMale, math, eng)
}

public struct MyStruct2()

public struct Point3D(u64, u64, u64)

public fun create_cord() : Point3D{
    let points = Point3D(10, 20, 30);
    points
}

public fun get_cord(points: Point3D) : (u64, u64, u64){
    // let x_cord = points.0;

    let x;
    let y;
    let z;
    Point3D(x, y, z) = points;
    (x, y, z)
}