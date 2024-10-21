# Cairo Crash Course 

## Advanced data types - Exercise 2

### Contract Implementation
Complete the skeleton of the function `build_arrays` in `advanced_types_exercise_2.cairo` with the following:

1. Create an array with felts and append the following elements:
   - 'foo'
   - 1337
   - 'Cairo rulez'

2. Print each array element, choosing your preferred format. Also, choose your preferred read method from the array trait to do so (remember `get()` and `at()`).

3. In the same function implement the necessary assertions to check that each index value corresponds to the element stored. 

### Writing Tests
In the test file `test_advanced_types_2.cairo`, just invoke your function `build_arrays` and if your assertions where correctly implemented all the tests should pass 🎉🥳

## Useful links
[Cairo Book: Arrays](https://book.cairo-lang.org/ch03-01-arrays.html)

## Notes
For this exercise do not worry about out-of-bounds scenarios or gas :D