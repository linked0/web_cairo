# Cairo crash course
## Basic data types - Exercise 1 - A mutant token 

Alright, buckle up, fellow Cairo coders! It's time to start with some cairo crash course hands-on exercises, and our first stop? Basic data types for smart contracts.

### Contract Implementation
Your first task is to fill the skeleton of the function `token_status() -> felt252 ` in the `basic_types_exercises_1.cairo` file with the following instructions:

- Declare a `u64` variable `my_token` whose value is 200 and print it.
- Execute a type conversion to `my_token` into (remember `into()`?) `felt252` and print again the variable. 
- Let's call our token `STRK`. Assign the value `STRK` to `my_token` and of course print it (expect an unexpected print value 😉)
- Open an inner scope change the value of our token 500 inside. Print it out!
- Oh no, disaster strikes! Our token's value plummets to zero. Let's assign this unfortunate value outside of the inner scope. (Hopefully that will never happen to us in real life 🤞✨). 
- Return `my_token`

Check that your `.cairo` file compiles and the test passes by executing the command `snforge test basic_types_1`.

Bonus: Take a look at the `test_basic_types_1.cairo` and try to understand how it works.

   
## Useful links
[Cairo Book: Variables and Mutability](https://book.cairo-lang.org/ch02-01-variables-and-mutability.html)

[Cairo Book: Data Types](https://book.cairo-lang.org/ch02-02-data-types.html)