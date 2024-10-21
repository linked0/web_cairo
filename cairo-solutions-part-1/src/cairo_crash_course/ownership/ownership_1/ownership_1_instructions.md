# Cairo Crash Course

## Ownership - Exercise 1

In this exercise, we will practice Cairo ownership features using `Structs`.
We will also explore snapshots and disnapping variables.

### Contract Implementation

In `ownership_exercise_1.cairo`, complete the following:

- Create a `Struct` named `Position` with `price: u32` and `amount: u32`.

- Create a `get_value` function:

  - Takes a snapshot of `Position` and returns a `u32`.
  - Desnap `price` and `amount`, then multiply them.

- Create a `change_value` function:
  - Takes a reference of `Position`.
  - Flips the values:
    - `price` becomes `amount`.
    - `amount` becomes `price`.

### Writing Tests

In the `test_ownership_1.cairo` file inside `test_snapshots_references()`, do the following:

- Declare a mutable variable `p1` with `Position` (price: 3000, amount: 10).
- Invoke `get_value(p1)` and assert the expected return value.
- Invoke `change_value(p1)` and make sure that the fields are flipped.

Check the exercise by running the command `snforge test ownership_1`.

## Useful links

[References and Snapshots](https://book.cairo-lang.org/ch04-02-references-and-snapshots.html)
