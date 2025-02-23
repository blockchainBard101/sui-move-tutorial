# Move Programming: Structs and Abilities

Welcome to this guide on structs and abilities in the Move programming language! 🚀 This tutorial covers how to define and use structs, assign abilities, and work with struct instances effectively in Move.

## Introduction
Structs are user-defined data structures that contain typed fields of custom data or no data. They can be assigned abilities that define their behavior, such as whether they can be copied, stored, or transferred.

In this guide, you'll learn the following:
- How to define and use structs
- Understanding struct abilities (`key`, `drop`, `copy`, `store`)
- Creating and modifying struct instances
- Sharing objects in Move

## Defining Structs
Move structs are declared using the `struct` keyword. Here’s an example of a `Student` struct with different field types:

```move
module structs::structs;

// Defining the Student struct
public struct Student has key {
    id: UID,
    age: u8,
    isMale: bool,
    grades: Grades,
}

// Defining the Grades struct
public struct Grades has drop, copy, store {
    math: u64,
    english: u64,
}
```
### Explanation:
- `Student` struct represents a student entity with a unique ID (`UID`), age, gender, and academic grades.
- `Grades` struct holds numerical grades for math and English.
- Abilities:
  - `copy` – Allows the struct to be duplicated.
  - `drop` – Allows the struct to be discarded.
  - `store` – Allows the struct to be stored in global storage. In Sui, it determines what data can be stored in an object and transferred outside its defining module.
  - `key` – Allows the struct to be used as a storage identifier. In Sui, it signifies an object.

## Creating and Modifying Struct Instances

### Creating a Grades Instance
We can create an instance of `Grades` and modify its values as follows:

```move
public fun create_grade() {
    let grade = Grades {
        math: 65,
        english: 89,
    };
    
    let mut grades2 = copy grade; // Copying the struct
    grades2.english = 45;
    grades2.math = 76;
}
```
### Explanation:
- `create_grade()` initializes a `Grades` struct with math and English scores.
- Using `copy`, a new mutable instance `grades2` is created and modified.

### Creating a Student Instance

```move
public fun create_student(ctx: &mut TxContext) {
    let student = Student {
        id: object::new(ctx),
        age: 16,
        isMale: true,
        grades: Grades {
            math: 70,
            english: 76,
        }
    };
    transfer::share_object(student); // Sharing the object
}
```
### Explanation:
- `create_student(ctx)` initializes a `Student` struct with an `id`, `age`, `isMale`, and `grades`.
- The `object::new(ctx)` function generates a new unique ID.
- `transfer::share_object(student)` makes the student object accessible to others.

## Object Sharing in Move
Move enforces ownership rules, and objects must be explicitly shared to allow external access. There are two main ways to share objects:

1. `transfer::share_object(student);` → Publicly shares the object for other modules.
2. `transfer::public_share_object(student);` → Allows further modifications by external modules.

## **Assignment**  

### **Objective**  
Create a `Wallet` object that stores token information and allows deposit, withdrawal, retrieval of token details and delete wallet.  

### **Wallet Structure**  
The `Wallet` struct should contain the following fields:  
1. **`owner_address`**: `address` → The address of the wallet owner.  
2. **`token`**: `Token` → A struct representing the token, which includes:  
   - **`name`**: `String` → The name of the token.  
   - **`balance`**: `u64` → The balance of the token.  

### **Required Functions**  
Implement the following functions for the `Wallet` struct:  

1. **`create_wallet(ctx: &mut TxContext) -> Wallet`**  
   - Creates a new wallet with an initial token balance of `0`.  
   - Sets the `owner_address` to `ctx.sender()`.  

2. **`deposit(wallet: &mut Wallet, amount: u64)`**  
   - Increases the wallet's token balance by `amount`.  

3. **`withdraw(wallet: &mut Wallet, amount: u64)`**  
   - Decreases the wallet's token balance by `amount`.  
   - Ensure the balance does not go negative (i.e., enforce sufficient balance).  

4. **`get_token(wallet: &Wallet) -> Token`**  
   - Returns the `Token` struct associated with the wallet.  

5. **`get_balance(wallet: &Wallet) -> u64`**  
   - Returns the balance of the wallet’s token.
   - 
6. **`delete_wallet(wallet: Wallet)`**  
   - Deletes the wallet.  


### **Additional Notes**  
- Utilize **struct abilities** in Sui Move for proper data handling.  
- Use `std::string::String` for string type handling.  
- Retrieve the wallet owner's address using `ctx.sender()`.  

**Hint:**  
You can define `Token` as a separate struct and embed it within `Wallet`.  

## Summary
- Structs in Move allow you to group related data.
- Abilities (`key`, `copy`, `drop`, `store`) define how structs behave.
- Objects must be shared using `transfer::transfer()`.
- Move enforces strict ownership and storage rules for struct instances.

### Solution
[Solution](https://github.com/blockchainBard101/sui-move-tutorial/blob/main/7-structs-ability/wallet/sources/wallet.move).

## Video Solution
For a step-by-step walkthrough, watch this video tutorial:

[![Solution](https://img.youtube.com/vi/HIWlAThYBzs/0.jpg)](https://youtu.be/HIWlAThYBzs)

---
## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Structs](https://img.youtube.com/vi/eEy4uudac7Q/0.jpg)](https://youtu.be/eEy4uudac7Q)

---

## Additional Resources
Refer to the [Move Book: Structs](https://move-book.com/reference/abilities.html) for more details on Move programming.

Happy coding! 🎯

