# Cairo crash course 

## Functions - Exercise 1 - Refactoring functions
In this exercise, we'll be refactoring functions in Cairo for evaluating token values. 😊

For this exercise we will use `structs`, but don't `panic!`😬, the code for this part will be already given and of course `structs` topic will be covered later!😉 Hence it will be very useful for you to start getting familiar with this particular Data Type 💪

Let's imagine a situation where we have investments in STRK tokens and want to figure out their value. For this exercise, let's assume a constant token price of $1,000 USD for STRK Token. We'll now proceed to create the functions needed to calculate our investments.

### Contract Implementation
To kick off, let's dive into the main formula:
`INVESTMENTS = AMOUNT of TOKENS * PRICE`

We'll be working on the `functions_exercise_1.cairo` file to implement this functionality.

#### Calculate the value of your investments
- First, create a `function calculate_value(amount: u64, price: u64) -> u64`. 
- This function takes two parameters: the amount of tokens we possess and the known price (which is $1,000 for this exercise). It should return the product of `amount * price`.
- Next, let's define another function called `my_investments() -> u64`. Here, we'll declare two variables: `tokens_strk` and `price_in_usd`. Assign 1000 to `price_in_usd`, and set any desired amount to `tokens_strk`.
- Create a new variable `total_value` to store the result of the calculate_value function, passing the appropriate variables as parameters.
- Print out `total_value` and return it.

#### Refactor using Tuples 
Now, create two new functions: `calculate_value_tuple` and `my_investments_tuple`, and refactor the previous functions. They should work in the same way but utilize a tuple of type `(u64, u64)` instead.

#### Refactor `calculate_value` using a Struct
Create two new functions: `calculate_value_struct` and `my_investments_struct`, and refactor the previous functions. They should maintain the same functionality but use a struct with two `u64` attributes: `amount` and `price`.

### Checking the exercise
Once you've completed the tasks, run the command `snforge test functions_1` to verify that all tests pass.

## Useful Links
[Cairo Book: Functions](https://book.cairo-lang.org/ch02-03-functions.html)