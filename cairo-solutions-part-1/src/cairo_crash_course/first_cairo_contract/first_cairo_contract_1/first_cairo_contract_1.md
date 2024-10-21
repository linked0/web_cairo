# Cairo Crash Course

## First Cairo Contract - Exercise 1

In the following exercise your goal is to create a simple smart contract with Storage, and Events.

If you are not sure about the syntax, you can always refer to the Lecture video or to the [Cheatsheet File](../../../../cheatsheet/cairo_syntax_cheatsheet.pdf).

## Tasks

In the file `first_cairo_contract.cairo`:

1. Define an interface `IMyFirstCairoContract` with 2 functions:
   1. `set_number()` - receives a u256 `number` and returns nothing.
   2. `get_number()` - received nothing and returns a u256.
2. Create a new cairo smart contract `MyFirstCairoContract`:
   1. Define the contract storage with one `u256` variable named `number`.
   2. Define an event that is called `NumberChanged`, which will be emitted anytime the number is being changed in the storage, the event should be emitted with the old and new number
   3. Create a constructor function that receives an `initial_value` u256 and write it to storage, don't forget to emit a `NumberChanged` event.
   4. Implement the `IMyFirstCairoContract` interface, and both `set_number()` and `get_number()` accordingly so they will set and get the number from the contract's storage, and emit and event in case the number is changed.

## Checking the Exercise

1. We haven't learned how to write tests yet so I will go easy on you 😉
2. For now you can just take a look at the `test_first_cairo_contract_1.cairo` and try to understand how it works.
3. Execute `snforge test first_cairo_contract_1` and make sure all the tests pass.

## Useful links

[Anatomy of a Simple contract](https://book.cairo-lang.org/ch13-02-anatomy-of-a-simple-contract.html)

[Contract Storage](https://book.cairo-lang.org/ch14-01-contract-storage.html)

[Contract Functions](https://book.cairo-lang.org/ch14-02-contract-functions.html)

[Contract Events](https://book.cairo-lang.org/ch14-03-contract-events.html)

[Running Tests snfoge](https://foundry-rs.github.io/starknet-foundry/testing/running-tests.html)
