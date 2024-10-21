# Starknet Foundry Exercise 2

## Intro

Your goal is to test some of the cheatcodes that Starknet Foundry offers.

## Tasks

Check the `identity_contract.cairo` file, and find out what functions can be called.

In the `test_starknet_foundry_2.cairo` file:
1. Create 3 addresses (Alice, Bob, and Charlie).
2. Call the `who_is_calling()` function as Alice, Bob and Charlie, and check if the function returned the correct caller.
3. Change block timestamp to 100, call function `what_time_is_it()`, and make sure that the block timestamp is updated.

Make sure all the tests pass by running the command `snforge test starknet_foundry_2`.

## Useful links

[Foundry Cheatcodes](https://foundry-rs.github.io/starknet-foundry/appendix/cheatcodes.html)

[Using Cheatcodes](https://foundry-rs.github.io/starknet-foundry/testing/using-cheatcodes.html)