# Create a New Package

To create a new program, we will use the `sui move new` command followed by the name of the application. Our first program will be called `hello_world`.

```bash
$ sui move new hello_world
```

The `sui move` command provides access to the Move CLI - a built-in compiler, test runner, and utility for all things Move. The `new` command followed by the name of the package creates a new package in a new folder. In this case, the folder name is `hello_world`.

You can verify the package creation by listing the contents of the folder:

```bash
$ ls -l hello_world
Move.toml
sources
tests
```

## Directory Structure

Move CLI creates a scaffold for the application, including the directory structure and necessary files. Here's the directory layout:

```
hello_world
├── Move.toml
├── sources
│   └── hello_world.move
└── tests
    └── hello_world_tests.move
```

### Manifest

The `Move.toml` file, known as the package manifest, defines configurations for the package. It is used by the Move Compiler to manage package metadata, fetch dependencies, and register named addresses. By default, the package has one named address:

```toml
[addresses]
hello_world = "0x0"
```

### Sources

The `sources/` directory contains Move source files with a `.move` extension. By default, the `hello_world.move` file contains commented-out code:

```move
/*
/// Module: hello_world
module hello_world::hello_world;
*/
```

The `/*` and `*/` are comment delimiters in Move. Everything between them is ignored by the compiler and can be used for documentation or notes.

### Tests

The `tests/` directory contains package tests, excluded from the regular build process but used in test and dev modes. Tests are written in Move and marked with the `#[test]` attribute. The default `hello_world_tests.move` file contains:

```move
/*
#[test_only]
module hello_world::hello_world_tests;
// Uncomment this line to import the module
// use hello_world::hello_world;

const ENotImplemented: u64 = 0;

#[test]
fun test_hello_world() {
    // pass
}

#[test, expected_failure(abort_code = hello_world::hello_world_tests::ENotImplemented)]
fun test_hello_world_fail() {
    abort ENotImplemented;
}
*/
```

### Other Folders

Move CLI also supports the `examples/` folder for example files, treated similarly to files in the `tests/` folder. These files are built only in test and dev modes and are often used for documentation or library packages.

## Compiling the Package

Move source files are compiled into Move Bytecode. Replace the contents of `sources/hello_world.move` with the following:

```move
/// The module `hello_world` under named address `hello_world`.
/// The named address is set in the `Move.toml`.
module hello_world::hello_world;

// Imports the `String` type from the Standard Library
use std::string::String;

/// Returns the "Hello, World!" as a `String`.
public fun hello(): String {
    b"Hello, World!".to_string()
}
```

Compile the package with:

```bash
$ sui move build
```

If not in the package directory, specify the path:

```bash
$ sui move build --path hello_world
```

This command creates a `build/` folder with compiled dependencies and bytecode. Use `.gitignore` to exclude this folder in version control.

## Running Tests

Replace `tests/hello_world_tests.move` with:

```move
#[test_only]
module hello_world::hello_world_tests;

use hello_world::hello_world;
use std::debug;

const ENotImplemented: u64 = 0;

#[test]
fun test_hello_world() {
    debug::print(&hello_world::hello());
}

#[test, expected_failure(abort_code = ::hello_world::hello_world_tests::ENotImplemented)]
fun test_hello_world_fail() {
    abort ENotImplemented;
}
```

Run tests with:

```bash
$ sui move test
```

Example output:

```
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Running Move unit tests
[ PASS    ] 0x0::hello_world_tests::test_hello_world
[ PASS    ] hello_world::hello_world_tests::test_hello_world_fail
Test result: OK. Total tests: 2; passed: 2; failed: 0
```

Run tests from outside the package folder:

```bash
$ sui move test --path hello_world
```

Run specific tests by specifying a string:

```bash
$ sui move test test_hello
```

## Video Guide

Watch this video guide for additional help:

[![Install Sui on Windows](https://img.youtube.com/vi/owSlmn_-p3I/0.jpg)](https://youtu.be/Oh_Q6LTKmK4)

---

For Move coding conventions, see: [Sui Move Concepts](https://docs.sui.io/concepts/sui-move-concepts/conventions)

For more, refer to the Move Book: [Your First Move Program](https://move-book.com/your-first-move/hello-world.html)
