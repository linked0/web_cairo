# Hints

## Control Flow - Exercise 4
Here are some tips that will help you to implement this exercise :)

- Use `let mut i: u32 = 0;` given as an index for controlling the `while` loop.
- Use `let mut product: u32 = my_struct.product` to hold the value of the `product` field.

### Setting the while loop condition to evaluate
- Firstly, let's put the conditional that will control our `while` loop. Since we will be iterating over `my_array` field, its limit should be the array length, which can be defined with `my_struct.my_array.len()`. 

### Inside the loop
- Implement: `product` equals the current value of `product` times `*my_struct.my_array.at(i)` to multiply all the elements of `my_array`.
- Increment the index `i += 1`.

#### Outside the loop
- Print the `product` variable that should contain the final result.
- Return the `product`.