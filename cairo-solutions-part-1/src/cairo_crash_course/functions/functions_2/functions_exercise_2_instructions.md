# Cairo Crash Course 

## Functions - Exercise 2 - Chasing perfection
We are going to continue the practice chasing perfection in our code!
For that, we will create a function to verify if the number provided is perfect :D
You will solve this exercise using a combination of if statements and loops 👀

### Contract Implementation
A perfect number is a positive integer that is equal to the sum of its proper divisors. 
For example: the smallest perfect number is 6, which is the sum of 1, 2, and 3.
[Read more here](https://en.wikipedia.org/wiki/Perfect_number).

Complete the function `is_perfect(number: u128) -> bool` tn the cairo file `functions_exercise_2.cairo`. The function receives a `number` (The number to be checked) and returns boolean which determines wether the number is perfect or not.

#### Base cases
- if `number` is equal to 0 return false.
- if `number` is equal to 1 return false.

### Checking the exercise
Once you've completed the tasks, run the command `snforge test functions_2` to verify that all tests pass.

## Useful links
[Cairo Book: Functions](https://book.cairo-lang.org/ch02-03-functions.html)