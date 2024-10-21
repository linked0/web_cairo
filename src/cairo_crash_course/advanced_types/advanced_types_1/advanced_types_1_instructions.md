# Cairo Crash Course 

## Advanced Data Types - Exercise 1

### Building a simple dictionary
Fill the skeleton of the function `build_dictionary` using the following instructions in `advanced_types_exercise_1.cairo`:

- Create a `Felt252Dict<u64>` named `tokens`. It will represent a dictionary of tokens and their corresponding value. The dictionary should contain these entries:

```
Dodgecoin => 1150
Bitcoin => 1210
ETH => 1011
Solana => 1710
STRK => 1337
```

### Verifying the dictionary entries
- After creating the entries, in the same function implement the necessary assertions to check that each key corresponds to their respective value. 
- Implement an extra assertion to check what happens if you read a nonexistent key. What is the value returned? 🤔

### Implementing Tests
- In the test file `test_advanced_types_1.cairo` just invoke your function `build_dictionary` and if your assertions where correctly implemented all the tests should pass :D

## Useful links
[Cairo Book: Dictionaries](https://book.cairo-lang.org/ch03-02-dictionaries.html)