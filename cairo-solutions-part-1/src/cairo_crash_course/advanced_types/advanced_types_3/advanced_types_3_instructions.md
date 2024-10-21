# Cairo Crash Course

## Advanced data types - Exercise 3

### Contract Implementation

Complete the skeleton of the function `calculate_multiples` in `advanced_types_exercise_3.cairo` with the following:

1. The function `calculate_multiples` that takes two parameters:

   - `base`: A u256 that represents the base number.
   - `count`: A u256 that represents the number of multiples to generate.

2. Initialize an empty array to store the multiples.

3. Use a loop to calculate the first `count` multiples of `base` and append each multiple to the array.

4. Return the array

### Writing Tests

1. In the test file `test_advanced_types_3.cairo`, invoke your function `calculate_multiples` with different values for `base` and `count` based on the written TODOs.
2. implement the necessary assertions to check that each index value in the array corresponds to the correct multiple of `base`. If your assertions are correctly implemented, all tests should pass 🎉🥳

### Example

If `base` is 3 and `count` is 5, the array should contain: `[3, 6, 9, 12, 15]`

## Useful links

[Cairo Book: Arrays](https://book.cairo-lang.org/ch03-01-arrays.html)
