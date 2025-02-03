# Move Programming Basics: Functions and Accessibility Levels

Welcome to the repository for learning about functions and their accessibility levels in the Move programming language! 🚀 This guide is ideal for developers looking to understand the nuances of defining and using functions in Move, including internal, public, and package-private functions.

## Introduction
Move is a safe and efficient language for smart contract development. In this tutorial, you'll learn about:
- Defining functions
- Function visibility levels (internal, public, package-private)
- Usage examples

## Function Types and Accessibility Levels

### Internal Functions
Internal functions are only accessible within the module in which they are defined. They are useful for encapsulating logic that should not be exposed externally.
```move
fun add(num1: u64, num2: u64): u64 {
    let addition = num1 + num2;
    addition
}
```
- **Description**: Adds two unsigned 64-bit integers.
- **Parameters**:
  - `num1` (u64): First number to add.
  - `num2` (u64): Second number to add.
- **Return Value**: Sum of `num1` and `num2`.

### Public Functions
Public functions can be called from anywhere, including other modules and transactions. They provide the primary interface for interacting with a module's logic.
```move
public fun calculate(a: u64, b: u64): u64 {
    add(a, b)
}
```
- **Description**: Calls the internal `add` function to perform addition.
- **Parameters**:
  - `a` (u64): First number to add.
  - `b` (u64): Second number to add.
- **Return Value**: Sum of `a` and `b`.

### Package-private Functions
Package-private functions are accessible only within the same package. They enable sharing functionality between modules in the same package while restricting external access.
```move
public(package) fun calc(a: u64, b: u64) {
    a + b;
}
```
- **Description**: Demonstrates addition within the package. The result is not returned.
- **Parameters**:
  - `a` (u64): First number to add.
  - `b` (u64): Second number to add.

## Usage Examples

### Using the Public Function
To perform an addition operation using the public `calculate` function:
```move
let result = basic_functions::calculator::calculate(5, 10);
// result will be 15
```

### Accessing Package-private Functions
If you are working within the same package, you can call the `calc` function:
```move
basic_functions::calculator::calc(8, 12);
// Performs addition, but the result is not returned.
```

### Internal Function Access
The `add` function is only accessible within the `basic_functions::calculator` module. It cannot be called directly from outside.

## Function Visibility Levels in Move
- **Internal (`fun`)**: Restricted to the module where defined.
- **Public (`public fun`)**: Accessible from anywhere.
- **Package-private (`public(package) fun`)**: Accessible within the same package.

---

## Assignment

### Task:
Create a package named `calculator`. Within this package, create a module also named `calculator`. Define 5 functions in the module: 4 internal functions and 1 public function. 

#### Internal Functions
- **Names**: `add`, `subtract`, `multiply`, and `divide`
- **Specifications**:
  - Accept two arguments of type `u8`.
  - Perform the respective operation (add, subtract, multiply, or divide) on the arguments.
  - Return the result as a value of type `u32`.

#### Public Function
- **Name**: `answer`
- **Specifications**:
  - Accept two arguments of type `u16`.
  - Pass these arguments to each of the internal functions (convert them to `u8` if needed).
  - Collect the returned values from the internal functions.
  - Return all the results (4 values) as type `u64`.

### Solution
[Solution](https://move-book.com/reference/functions.html).
---


## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Install Sui on Windows](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/TmFJKKmGb-0)

---

## Additional Resources

Refer to the [Move Book: Modules and Functions](https://move-book.com/reference/functions.html) for more details on Move programming.
