# Move References & Mutability Tutorial

## Introduction
This tutorial covers how to use references and mutability in the Move programming language. References allow functions to read and modify values without taking ownership, making them essential for efficient and safe programming in Move.

## Understanding References in Move
Move supports two types of references:
1. **Immutable References (`&T`)** - Allow reading a value without modifying it.
2. **Mutable References (`&mut T`)** - Allow modifying a value without transferring ownership.

---

## 1. Defining an Account Struct
We define a struct `Account` with a single field `balance` representing the user's account balance.

### Example:
```move
module references::references;

public struct Account has drop {
    balance: u64,
}
```

### Explanation
✅ The `Account` struct has a `balance` field to store the account balance.
✅ The `has drop` keyword allows Move to drop (deallocate) the struct when it's no longer needed.

---

## 2. Creating an Account
A function to initialize an `Account` instance with a balance of zero.

```move
public fun create_account(): Account {
    let account = Account {
        balance: 0
    };
    account
}
```

### Explanation
✔ The `create_account` function returns a new `Account` with an initial balance of `0`.
✔ Ownership of the struct is returned to the caller.

---

## 3. Reading an Account's Balance
To retrieve the balance without modifying it, we use an **immutable reference (`&T`)**.

```move
public fun get_balance(account: &Account) : u64 {
    account.balance
}
```

### Explanation
✅ Uses an immutable reference `&Account` to read the balance.
✅ Prevents accidental modification of the balance.

---

## 4. Modifying an Account Balance
To modify the balance, we use a **mutable reference (`&mut T`)**.

```move
public fun deposit(account: &mut Account, amount: u64) {
    account.balance = amount;
}
```

### Explanation
✔ Uses a mutable reference `&mut Account` to modify `balance`.
✔ Allows updating the balance without transferring ownership.

---

## 5. Closing an Account
To retrieve the balance and remove the account, we return the balance and consume the struct.

```move
public fun close_account(account: Account) : u64 {
    let Account { balance } = account;
    balance
}
```

### Explanation
✅ `close_account` takes ownership of `account`.
✅ Returns the balance and deallocates the struct.

---

## 6. Working with References
Move allows reading and modifying values using references.

### Reading a Value Through a Reference
```move
public fun read_through_ref(balance_ref: &u64) : u64 {
    *balance_ref
}
```
✅ Uses an immutable reference `&u64`.
✅ Dereferences `balance_ref` using `*balance_ref` to access the value.

### Writing a Value Through a Reference
```move
public fun write_through_ref(balance_ref: &mut u64, new_value: u64) {
    *balance_ref = new_value;
}
```
✅ Uses a mutable reference `&mut u64`.
✅ Modifies the value by dereferencing `*balance_ref`.

---

## 7. Mixing Mutable and Immutable References
Move enforces strict reference rules to prevent data races.

```move
public fun add_mut_immut(a: &mut u64, b: &u64): u64 {
    *a + *b
}
```
✅ Accepts a mutable reference (`&mut u64`) and an immutable reference (`&u64`).
✅ Dereferences both values and returns their sum.

---

## 8. Returning References from Functions

### Returning an Immutable Reference
```move
public fun takes_immutable(a: &u64): &u64 {
    a
}
```
✔ Returns an immutable reference to `a`.
✔ Safe because immutable references do not allow modifications.

### Returning a Mutable Reference
```move
public fun takes_mutable(a: &mut u64) : &u64 {
    a
}
```
✔ Returns a reference to a mutable value.
✔ Can be modified after being returned.

### Invalid Example: Returning a Mutable Reference from an Immutable Input
```move
// public fun takes_immutable_returns_mut(a: &u64) : &mut u64{
//     a
// }
```
❌ Not allowed in Move.
❌ Cannot return a mutable reference from an immutable reference.

---

## Conclusion
In this tutorial, we covered:
- How to define structs in Move.
- Using **immutable references (`&T`)** for read access.
- Using **mutable references (`&mut T`)** for modifying values.
- Returning references from functions.
- Move's strict reference rules to prevent unsafe memory access.

By mastering references and mutability, you can write efficient and safe Move smart contracts. 🚀

## Video Guide

For a step-by-step walkthrough, watch this video tutorial:

[![Structs](https://img.youtube.com/vi/hn8FQfJ8zDQ/0.jpg)](https://youtu.be/hn8FQfJ8zDQ)

## Additional Resources
- [Move Book: References](https://move-book.com/move-basics/references.html)

