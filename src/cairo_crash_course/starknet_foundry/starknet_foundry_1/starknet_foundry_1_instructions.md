# Starknet Foundry Exercise 1

## Intro

Your goal is to deploy the contract `value_contract`, test that the deployment was successful and interact with the contract 😊

## Tasks

Check `value_contract.cairo` file, and find out what functions can be called.

In the `test_starknet_foundry_1.cairo` file:
1. Implement a `deploy_contract()` function, which will deploy an instance of the `value_contract`.
2. In the test `test_deploy_contract()`, deploy the contract and check if it is deployed.
3. Declare a dispatcher in the test `test_add_value()`.
4. Add a value of 5 to the contract.
5. Check if the contract holds value 5.

Make sure all the tests pass by running the command `snforge test starknet_foundry_1`.

## Useful links

[Starknet Foundry writing tests](https://foundry-rs.github.io/starknet-foundry/testing/testing.html)

[Starknet Foundry testing contracts](https://foundry-rs.github.io/starknet-foundry/testing/contracts.html)
