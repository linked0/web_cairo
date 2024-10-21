# Cairo Crash Course

## Ownership - Exercise 2 

In this exercise we will explore the Cairo ownership rules when it comes to Arrays.
Our goal is to make the `do_something` and `do_something_again` functions run without a compilation error :)

### Contract Implementation

The `do_something` and `do_something_again` are two functions that do that exact same thing.

In `ownership_exercise_2.cairo`, complete `my_function()` as follows:

1. Create an array with 5 numbers
2. Create a variable `foo` to hold the result of `do_something(your_array)`, pass a `clone` of `arr` to `do_something()`.
3. Create a variable `bar` to hold the result of `do_something_again(arr: Array<u32>)`, pass the `arr` itself this time.

- Make sure that `foo` and `bar` are the same.

### Writing Tests

In `test_ownership_2.cairo` inside `test_ownership()`, call `my_function()`. If everything is correct, the test will pass smoothly! ✨✨✨

## Useful links

[Ownership](https://book.cairo-lang.org/ch04-00-understanding-ownership.html)
