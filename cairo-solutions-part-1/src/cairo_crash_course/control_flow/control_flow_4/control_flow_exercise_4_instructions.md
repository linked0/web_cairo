# Cairo Crash Course 

## Control Flow - Exercise 4
It is time for `while`! 🎉🎊✨

For this exercise we will use `structs` and `arrays`, but don't `panic!`😬, the code for this part will be already given and of course these topics will be covered later!😉

### Contract Implementation
Complete the function `using_while(my_struct: MY_STRUCT) -> u32` in `control_flow_exercise_4.cairo`.
The function receives a `my_struct: MY_STRUCT` and returns a `u32`. 

The following `struct` is already defined:
```rust
struct MY_STRUCT {
    product: u32,
    my_array: Array<u32>
}
```

This struct contains two items of type `u32` and `Array<u32>`, the function multiplies all the elements in `my_array` and the result is multiplied with the field `product`.

**For example:**
```
product: 2
my_array: [1, 2, 3, 4] (multiplying the elements) 24
using_while() = product * my_array = 48
```

Eventually the function should print to the console the result and return it.

### Checking The Exercises
Check that the exercises is completed by running the command `snforge test control_flow_4`.

## Useful Links
[While loops](https://book.cairo-lang.org/ch02-05-control-flow.html)