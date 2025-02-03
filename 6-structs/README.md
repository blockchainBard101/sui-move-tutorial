# Move Structs Tutorial

## Introduction
This tutorial covers how to define and use structs in the Move programming language. Structs in Move allow developers to create custom data types with named or positional fields.

## Struct Types in Move
Move supports two types of structs:
1. **Named Field Structs** - Structs with named fields for clarity and ease of access.
2. **Positional Structs** - Structs where fields are accessed by position instead of names.

---

## 1. Named Field Structs
A named field struct provides explicit field names, making the data structure easy to understand and use.

### Example
```move
module structs::structs;

use std::debug;

// Defining Named Field Structs
public struct Student {
    age: u8,
    isMale: bool,
    grades: Grades,
}

public struct Grades {
    math: u64,
    english: u64,
}
```

### Advantages
✅ Uses named fields (`age`, `isMale`, `grades`).
✅ Easy to understand and access specific values.
✅ Fields can be accessed using their names (`student.age`).

### When to Use?
✔ When clarity about each field is important.
✔ When fields are complex or need to be accessed individually.

### Creating and Accessing a Struct
```move
// Function to create a Student struct
public fun create_student(student_age: u8, is_male: bool, math: u64, english: u64): Student {
    let grades = Grades { math, english };
    let student: Student = Student {
        age: student_age,
        isMale: is_male,
        grades: grades,
    };
    student
}

// Function to retrieve student details
public fun get_student(student: Student): (u8, bool, u64, u64) {
    let Student { age, isMale, grades: Grades { math, english } } = student;
    (age, isMale, math, english)
}
```

---

## 2. Positional Structs
Positional structs do not use field names; instead, fields are accessed using their position (index).

### Example
```move
// Defining Positional Structs
public struct Point3D(u64, u64, u64);
```

### Advantages
✅ Uses positional values instead of named fields.
✅ Compact when only a few fields are needed.

### Disadvantages
❌ Less readable as it is unclear what each field represents.
❌ Not recommended for complex data structures.

### When to Use?
✔ When struct has a small number of fields.
✔ When field names are not important.
✔ For simple, ordered data.

### Creating and Accessing a Positional Struct
```move
// Function to create a Point3D struct
public fun create_point(): Point3D {
    Point3D(10, 20, 30) // x = 10, y = 20, z = 30
}

// Function to retrieve coordinates
public fun get_coordinates(point: Point3D): (u64, u64, u64) {
    let x_cord = point.0;
    let y_cord = point.1;
    let z_cord = point.2;
    (x_cord, y_cord, z_cord)
}
```

---

## Testing Structs in Move
To verify that our structs work correctly, we use Move's test framework.

### Test Module
```move
#[test_only]
module structs::structs_tests;
use structs::structs;
use std::debug;

#[test]
fun test_structs() {
    let student = structs::create_student(18, true, 76, 66);
    let (age, is_male, math, eng) = structs::get_student(student);

    let points = structs::create_point();
    let (x, y, z) = structs::get_coordinates(points);

    debug::print(&x);
    debug::print(&y);
    debug::print(&z);
}
```

### Expected Errors
Move enforces strict access control, so trying to access fields outside the module results in errors.

#### Example Errors
```text
error: Invalid access of field 'age' on the struct 'structs::structs::Student'. The field 'age' can only be accessed within the module 'structs::structs'.
```

```text
error: Invalid access of field '0' on the struct 'structs::structs::Point3D'. The field '0' can only be accessed within the module 'structs::structs'.
```

To fix this, ensure that you only access struct fields within the defining module or expose accessor functions.

---

## Conclusion
In this tutorial, we covered:
- How to define **Named Field Structs** and **Positional Structs** in Move.
- The advantages and use cases of each type.
- How to create and access struct fields.
- Writing tests and understanding Move's strict access control rules.

By mastering Move structs, you can efficiently manage and organize data in your smart contracts. 🚀

## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Structs](https://img.youtube.com/vi/vPv_KLcOoTc/0.jpg)](https://https://youtu.be/vPv_KLcOoTc)

---

## Additional Resources

Refer to the [Move Book: Structs](https://move-book.com/move-basics/struct.html) for more details on Move programming.