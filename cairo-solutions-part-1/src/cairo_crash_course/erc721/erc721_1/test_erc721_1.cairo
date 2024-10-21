use core::option::OptionTrait;
use core::traits::TryInto;
use core::traits::Into;
use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait,  start_cheat_caller_address, stop_cheat_caller_address,};

// Importing the IERC721Dispatcher and IERC721MintingAndBurningDispatcher traits
use openzeppelin::token::erc721::interface::IERC721Dispatcher;
use openzeppelin::token::erc721::interface::IERC721DispatcherTrait;
use cairo_course_exercises::cairo_crash_course::erc721::erc721_1::my_nft::ERC721MintableDispatcher;
use cairo_course_exercises::cairo_crash_course::erc721::erc721_1::my_nft::ERC721MintableDispatcherTrait;

fn deploy_erc721(deployer: ContractAddress) -> (ContractAddress, IERC721Dispatcher, ERC721MintableDispatcher) {
    // Declaring the contract class
    let contract_class = declare("MyNFT").unwrap().contract_class();
    // Creating the data to send to the constructor, first specifying as a default value
    let mut data_to_constructor = Default::default();
    // Packing the data into the constructor
    Serde::serialize(@deployer, ref data_to_constructor);
    // Deploying the contract, and getting the address
    let (address, _) = contract_class.deploy(@data_to_constructor).unwrap();

    // Returning the address of the contract and the dispatchers
    return (address, IERC721Dispatcher { contract_address: address }, ERC721MintableDispatcher { contract_address: address });
}

fn mint_nft(
    contract: ContractAddress, dispatcher: ERC721MintableDispatcher, deployer: ContractAddress, user: ContractAddress, tokenId: u256
) {
    // TODO: Implement this function, mint an NFT to the user
    start_cheat_caller_address(contract, deployer);
    dispatcher.mint(user, tokenId);
    stop_cheat_caller_address(contract);
}

#[test]
fn test_mint() {
    // Generating the deployer address
    let deployer: ContractAddress = 123.try_into().unwrap();

    // Deploying the contract
    let (erc721_address, erc721_general_dispatch, erc721_mint_dispatch) = deploy_erc721(deployer);

    // Creating the address of Alice
    let alice: ContractAddress = 1.try_into().unwrap();

    // TODO: Mint token id 1 to Alice
    mint_nft(erc721_address, erc721_mint_dispatch, deployer, alice, 1);

    // TODO: Check that Alice is the owner of token id 1
    assert(erc721_general_dispatch.owner_of(1) == alice, 'Alice is not the owner of 1');
}

#[test]
fn test_transfer() {
    // Generating the deployer address
    let deployer: ContractAddress = 123.try_into().unwrap();

    // Deploying the contract
    let (erc721_address, erc721_general_dispatch, erc721_mint_dispatch) = deploy_erc721(deployer);

    // Creating the address of the Alice and Bob
    let alice: ContractAddress = 1.try_into().unwrap();
    let bob: ContractAddress = 2.try_into().unwrap();
    // Mint token id 1 to Alice
    mint_nft(erc721_address, erc721_mint_dispatch, deployer, alice, 1);

    // TODO: Allow Bob to transfer the token with id 1
    start_cheat_caller_address(erc721_address, alice);
    erc721_general_dispatch.approve(bob, 1);
    stop_cheat_caller_address(erc721_address);

    // TODO: Transfer the token with id 1 from Alice to Bob as Bob
    start_cheat_caller_address(erc721_address, bob);
    erc721_general_dispatch.transfer_from(alice, bob, 1);
    stop_cheat_caller_address(erc721_address);

    // TODO: Check that Bob is the owner of token id 1
    assert(erc721_general_dispatch.owner_of(1) == bob, 'Bob is not the owner of 1');

    // TODO: Check that Alice's balance is 0 and Bob's balance is 1
    assert(erc721_general_dispatch.balance_of(alice) == 0, 'Alice balance is not 0');
    assert(erc721_general_dispatch.balance_of(bob) == 1, 'Bob balance is not 1');
}

