# Cairo Crash Course

## Ownership - Exercise 4

In this exercise we are going to use Arrays with spans.

**Reminder:** A span is a snapshot of an array that allows us to iterate over its elements.

### Contract Implementation

In the `ownership_exercise_4.cairo` file, complete the function `multiply_elements(my_array: @Array<u32>) -> u32`:

1. The function creates a span of `my_array` parameter.
2. Then it multiplies all its elements (using the span) returning the result.

### Tests

In the `test_ownership_4.cairo` file inside the `test_multiplication()`:

- Create an array `numbers: Array<u32>` with [1,2,3,4,5,6,7,8,9] as elements.
- Create a snapshot of `numbers` in the variable `my_snapshot`.
- Append the number 10 to the original `numbers` array.
- Invoke the `multiply_elements` function passing `my_snapshot` as parameter.
- Assert the final result - make sure the returned number is correct.

## Useful links

[Arrays](https://book.cairo-lang.org/ch03-01-arrays.html)

[Ownership](https://book.cairo-lang.org/ch04-00-understanding-ownership.html)

[References and Snapshots](https://book.cairo-lang.org/ch04-02-references-and-snapshots.html)
