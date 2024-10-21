use core::result::ResultTrait;
use core::traits::Into;
use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait,  start_cheat_caller_address, stop_cheat_caller_address,};

// Importing the IERC20Dispatcher and IERC20MintingAndBurningDispatcher traits
// Dispatcher allows us to call the contract functions
use openzeppelin::token::erc20::interface::IERC20Dispatcher;
use openzeppelin::token::erc20::interface::IERC20DispatcherTrait;

use cairo_course_exercises::cairo_crash_course::erc20::erc20_1::my_token::IERC20MintingAndBurningDispatcher;
use cairo_course_exercises::cairo_crash_course::erc20::erc20_1::my_token::IERC20MintingAndBurningDispatcherTrait;

fn deploy_erc20(deployer: ContractAddress) -> (ContractAddress, IERC20Dispatcher, IERC20MintingAndBurningDispatcher) {
    // Declaring the contract class
    let contract_class = declare("MyToken").unwrap().contract_class();
    // Creating the data to send to the constructor, first specifying as a default value
    let mut data_to_constructor = Default::default();
    // Packing the data into the constructor
    Serde::serialize(@deployer, ref data_to_constructor);
    // Deploying the contract, and getting the address
    let (address, _) = contract_class.deploy(@data_to_constructor).unwrap();

    // Returning the address of the contract and the dispatchers
    return (address, IERC20Dispatcher { contract_address: address }, IERC20MintingAndBurningDispatcher { contract_address: address });
}

fn mint_tokens(
    contract: ContractAddress, dispatcher: IERC20MintingAndBurningDispatcher, deployer: ContractAddress, user: ContractAddress, amount: u256
) {
    // TODO: Implement minting tokens to user
    start_cheat_caller_address(contract, deployer);
    dispatcher.mint(user, amount);
    stop_cheat_caller_address(contract);
}

// TODO: Complete the following test according to the instructions
#[test]
fn test_mint_and_burn() {
    let deployer: ContractAddress = 123.try_into().unwrap();

    // Deploying the contract and getting the dispatchers
    let (erc20Address, erc20GeneralDispatch, erc20MintDispatch) = deploy_erc20(deployer);

    // Creating the addresses of the alice and bob
    let alice: ContractAddress = 1.try_into().unwrap();
    let bob: ContractAddress = 2.try_into().unwrap();

    // TODO: mint 100 tokens to Alice and 200 to Bob
    mint_tokens(erc20Address, erc20MintDispatch, deployer, alice, 100);
    mint_tokens(erc20Address, erc20MintDispatch, deployer, bob, 200);

    // TODO: Make sure that both Bob and Aice have the right balances
    assert(erc20GeneralDispatch.balance_of(alice) == 100, 'Alice should have 100 tokens');
    assert(erc20GeneralDispatch.balance_of(bob) == 200, 'Alice should have 200 tokens');

    // TODO: burn 50 tokens from Alice
    start_cheat_caller_address(erc20Address, alice);
    erc20MintDispatch.burn(50);
    stop_cheat_caller_address(erc20Address);

    // TODO: Make sure that Aice has the right balances
    assert(erc20GeneralDispatch.balance_of(alice) == 50, 'Alice should have 50 tokens');
}

// TODO: Complete the following test according to the instructions
#[test]
fn test_transfer() {
    let deployer: ContractAddress = 123.try_into().unwrap();
    // Deploying the contract and getting the dispatchers
    let (erc20Address, erc20GeneralDispatch, erc20MintDispatch) = deploy_erc20(deployer);

    // Creating the addresses of the Alice and Bob
    let alice: ContractAddress = 1.try_into().unwrap();
    let bob: ContractAddress = 2.try_into().unwrap();

    // Minting tokens to Alice
    mint_tokens(erc20Address, erc20MintDispatch, deployer, alice, 100);

    // TODO: transfer 50 tokens from Alice to Bob
    start_cheat_caller_address(erc20Address, alice);
    erc20GeneralDispatch.transfer(bob, 50);
    stop_cheat_caller_address(erc20Address);

    // TODO: Add asserts to check that the Alice and Bob have the correct balance
    assert(erc20GeneralDispatch.balance_of(alice) == 50, 'Alice should have 50 tokens');
    assert(erc20GeneralDispatch.balance_of(bob) == 50, 'Bob should have 50 tokens');
}

// TODO: Complete the following test according to the instructions
#[test]
fn test_approve_and_transfer_from() {
    let deployer: ContractAddress = 123.try_into().unwrap();
    // Deploying the contract and getting the dispatchers
    let (erc20Address, erc20GeneralDispatch, erc20MintDispatch) = deploy_erc20(deployer);

    // Creating the addresses of the Alice and Bob
    let alice: ContractAddress = 1.try_into().unwrap();
    let bob: ContractAddress = 2.try_into().unwrap();

    // Minting tokens to Alice
    mint_tokens(erc20Address, erc20MintDispatch, deployer, alice, 100);

    // TODO: approve Bob to transfer 50 tokens from Alice
    start_cheat_caller_address(erc20Address, alice);
    erc20GeneralDispatch.approve(bob, 50);
    stop_cheat_caller_address(erc20Address);

    // TODO: transfer 50 tokens from Alice to Bob but do not use transfer() function
    start_cheat_caller_address(erc20Address, bob);
    erc20GeneralDispatch.transfer_from(alice, bob, 50);
    stop_cheat_caller_address(erc20Address);

    // TODO: Add asserts to check that the Alice and Bob have the right balance
    assert(erc20GeneralDispatch.balance_of(alice) == 50, 'Alice should have 50 tokens');
    assert(erc20GeneralDispatch.balance_of(bob) == 50, 'Bob should have 50 tokens');
}
