# Move Programming Basics: Variables and Primitive types(uint and bool)

Welcome to the repository for learning the fundamentals of variables and primitive types(uint and bool) in the Move programming language! 🚀 This guide is perfect for developers looking to understand how to declare variables, perform type casting, and execute safe arithmetic operations in Move.


## Introduction
The Move programming language is designed for safe and efficient smart contract development. In this tutorial, you'll learn the following:
- How to declare and use variables
- Boolean operations
- Integer arithmetic and type inference
- Preventing overflow errors

## Variable Declaration

### Immutable Variables
By default, variables in Move are immutable and cannot be reassigned after their initial declaration:
```move
let x: bool = true; // Immutable variable
```

### Mutable Variables
To make a variable mutable, use the `mut` keyword:
```move
let mut y: u8 = 42; // Mutable variable

// Reassigning the value
y = 43;
```

### Variable Shadowing
You can declare a variable with the same name to "shadow" the original variable:
```move
let x: u8 = 42;
let x: u16 = 42; // Shadows the previous variable
```

## Booleans
The `bool` type represents a boolean value, which can either be `true` or `false`:
```move
let flag = true;  // Compiler infers the type as bool
let is_valid = false;
```

## Integer Types
Move supports various unsigned integer types:
- `u8`, `u16`, `u32`, `u64`, `u128`, `u256`

Example:
```move
let small_number: u8 = 42;
let large_number: u128 = 42;
```
The default type is `u64` if no explicit type is provided.

## Arithmetic Operations
Move supports standard arithmetic operations:
- Addition (`+`)
- Subtraction (`-`)
- Multiplication (`*`)
- Division (`/`)
- Modulus (`%`)

Example:
```move
let result = 5 + 3; // Addition
```

### Safety
Move prevents overflow/underflow by aborting at runtime if a value exceeds its type's range:
```move
let x: u8 = 255;
let y: u8 = 1;

// This will raise an error
let z = x + y;
```

## Casting Between Types
Explicit type casting is done using the `as` keyword:
```move
let x: u8 = 42;
let y: u16 = x as u16;
```
Parentheses may be required for clarity in complex expressions:
```move
let z = 2 * (x as u16);
```

## Overflow Handling
Move enforces safe arithmetic by disallowing overflow or underflow:
```move
let x: u8 = 255;
let y: u8 = 1;

// Raises a runtime error
let z = x + y;
```

## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Install Sui on Windows](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/jywiLWHP7yQ)

---

## Additional Resources

Refer to the [Move Book: Your First Move Program](https://move-book.com/move-basics/primitive-types.html) for more details on Move programming.
