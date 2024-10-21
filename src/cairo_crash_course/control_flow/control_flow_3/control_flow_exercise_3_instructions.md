# Cairo Crash Course 

## Control Flow - Exercise 3 - Satisfy my conditions
In this exercise, we'll delve into loops with if statements. 
Plus, we'll work a bit with arrays, even though we haven't formally discussed them yet (they'll be covered in the Advanced Data Types Chapter), don't worry we'll guide you through it :)

### Contract Implementation
- Complete the function `looping_conditionals()` in `control_flow_exercise_3.cairo`.
- The function receives an `array_of_numbers: Array<u128>` and returns a `u32`.
- Use `let mut i: u32 = 0;` given as an index for controlling the loop.

Using the loop iterate through all the array elements and satisfy the conditions in the following order:

- If the element of the array is equal to 100, print "The number 100 is too big, get out of here!" and break the loop.
- If the array element is even, print it and write that it's even. 
- If the array element is equal to 11, increment `index += 1` and then continue to the next iteration.
- In every iteration print the array index.

Check that the exercises is completed by running the command `snforge test control_flow_3` and making sure that:
1. All tests passed successfully.
2. The function printed the same values as written in the "Expected Output" sections in the test file.

## Useful links
[Cairo Book: Control Flow](https://book.cairo-lang.org/ch02-05-control-flow.html)

[Cairo Book: Arrays](https://book.cairo-lang.org/ch03-01-arrays.html)