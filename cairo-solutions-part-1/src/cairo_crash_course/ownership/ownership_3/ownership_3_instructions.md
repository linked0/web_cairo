# Cairo Crash Course

## Ownership - Exercise 3

In this exercise we will pass structs to functions by snapshot and by reference.
In the function we will do some operations with the struct fields.

### Contract Implementation

In the `ownership_exercise_3.cairo` file:

1. Declare a struct with the name `Token` that contains the following fields:

```rust
name: ByteArray,
value: u32,
```

1. Implement all the functions:
   1. `get_value(token: @Token)` -> `u32`: Gets the Token as a snapshot, prints and returns the `value` field.
   2. `get_name(token: @Token)` -> `ByteArray`: Gets the Token as a snapshot, prints and returns the `name` field.
   - Note: It might not be straightforward to return the name of the token 👀
   3. `set_name(ref token: Token, new_name: ByteArray)`: Gets the Token as a reference and sets the `name` field to the `new_name`.
   4. `set_value(ref token: Token, new_value: u32)`: Gets the Token as a reference and sets the `value` field to the `new_value`.

### Tests

In the `test_ownership_3.cairo` file inside the `test_set_and_get()` block:

1. Create a new token (`Token` type) with the values "STRK" and 100.
2. Use both the `get_value()` and `get_name()` functions to check that the data is correct.
3. Change the token's name to "ETH" using the `set_name()` function, and value to 200 using the `set_value()` function.
4. Use again the `get_value()` and `get_name()` functions to check that the data is correct.

## Useful links

[Ownership](https://book.cairo-lang.org/ch04-00-understanding-ownership.html)

[Traits in Cairo](https://book.cairo-lang.org/ch08-02-traits-in-cairo.html?highlight=bytearray#defining-a-trait)
