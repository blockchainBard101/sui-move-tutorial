# Move Vector Operations Tutorial

## Introduction
This tutorial covers vector operations and struct-based storage in the Move programming language, focusing on the Sui blockchain. We will explore how to create and manipulate vectors, work with structs, and write test functions.

## 1. Understanding Vectors in Move
Move provides built-in support for dynamic arrays using the `vector` type. Vectors allow us to store and manipulate collections of elements efficiently.

### Example: Working with Vectors
```move
#[test_only]
module vec::vec_tests;
use std::debug;

#[test]
fun test_vec() {
    let mut numbers = vector::empty<u64>();
    debug::print(&numbers.is_empty());
    debug::print(&numbers);
    vector::push_back(&mut numbers, 75);
    debug::print(&numbers);
    numbers.push_back(20);
    debug::print(&numbers);
    let numbers_length = numbers.length();
    debug::print(&numbers_length);
    debug::print(numbers.borrow(0));
    numbers.insert(33, 1);
    debug::print(&numbers);
    numbers.swap(0, 1);
    debug::print(&numbers);
    numbers.push_back(100);
    debug::print(&numbers);
    numbers.reverse();
    debug::print(&numbers);
}
```

## 2. Defining Structs in Move
Move allows developers to define custom data structures using `struct`. Let's define `Apple` and `Fruits` structs and store them on-chain.

### Example: Struct Definitions
```move
module vec::vec;
use std::string::String;

public struct Apple has store{
    color: String,
    size: u64,
}

public struct Fruits has key{
    id: UID,
    fruits: vector<Apple>,
}

fun init(ctx: &mut TxContext) {
    let fruits = Fruits{
        id: object::new(ctx),
        fruits: vector::empty<Apple>()
    };
    transfer::share_object(fruits);
} 
```

## 3. Running Tests
To execute the test functions in Move, use the following command:
```sh
sui move test
```
This will run all test functions annotated with `#[test]` in your module.

---

## **Assignment**

### **Task:**  
Write a **Sui Move smart contract** that defines a **School** object with the following structure:

### **Object Structure**  
1. **School Object**  
   - `name`: The name of the school.  
   - `number_of_classes`: The total number of classes in the school.  
   - `number_of_students`: The total number of students in the school.  
   - `classes`: A vector containing multiple `Class` objects.  

2. **Class Struct**  
   - `name`: The name of the class.  
   - `num_of_students`: The number of students in the class.  
   - `students`: A vector containing multiple `Student` objects.  

3. **Student Struct**  
   - `name`: The name of the student.  
   - `age`: The age of the student.  

### **Required Functions**  

#### **Student Management**
1. `add_student(class_name, student)`: Add a student to a class.  
2. `remove_student(class_name, student_name)`: Remove a student from a class.  
3. `get_number_of_students(class_name)`: Get the number of students in a class.  
4. `check_student_exists(class_name, student_name)`: Check if a student exists in a class.  
5. `swap_students(class_name, index1, index2)`: Swap the positions of two students in a class.  
6. `reverse_students_order(class_name)`: Reverse the order of students in a class.  
7. `is_student_vector_empty(class_name)`: Check if the student vector in a class is empty.  
8. `remove_last_student(class_name)`: Remove the last student in a class.  
9. `insert_student_at(class_name, index, student)`: Insert a student at a specific position.  

#### **Class Management**
10. `add_class(class)`: Add a new class to the school.  
11. `remove_class(class_name)`: Remove a class from the school.  
12. `get_number_of_classes()`: Get the total number of classes in the school.  
13. `check_class_exists(class_name)`: Check if a class exists in the school.  
14. `swap_classes(index1, index2)`: Swap the positions of two classes.  
15. `reverse_classes_order()`: Reverse the order of classes in the school.  
16. `is_class_vector_empty()`: Check if the class vector is empty.  
17. `remove_last_class()`: Remove the last class from the school.  
18. `insert_class_at(index, class)`: Insert a class at a specific position.  

---

## **Conclusion**
This tutorial introduced vector operations, struct-based storage, and test functions in Move. You also have an assignment to reinforce your understanding of vector manipulations by implementing a School management contract.

## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Structs](https://img.youtube.com/vi/lf_v-5HlwAU/0.jpg)](https://youtu.be/lf_v-5HlwAU)

## **Additional Resources**
- [Move Book: Vectors](https://move-book.com/reference/primitive-types/vector.html)
- [Sui Docs: Vectors](https://docs.sui.io/references/framework/std/vector)

## **Contact Me**

- X (Twitter): [https://x.com/web3Bard101]
- Telegram: [https://t.me/blockchainbard_ai]