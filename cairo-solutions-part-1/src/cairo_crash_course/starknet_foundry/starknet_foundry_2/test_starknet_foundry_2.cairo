use core::traits::TryInto;
use starknet::ContractAddress;
use snforge_std::{
    declare, ContractClassTrait, DeclareResultTrait,  start_cheat_caller_address, stop_cheat_caller_address, start_cheat_block_timestamp,
    stop_cheat_block_timestamp
};

use cairo_course_exercises::cairo_crash_course::starknet_foundry::starknet_foundry_2::identity_contract::IIdentityContractDispatcher;
use cairo_course_exercises::cairo_crash_course::starknet_foundry::starknet_foundry_2::identity_contract::IIdentityContractDispatcherTrait;

fn deploy_contract() -> ContractAddress {
    let contract_class = declare("IdentityContract").unwrap().contract_class();
    let (deployed_contract, _) = contract_class.deploy(@ArrayTrait::new()).unwrap();
    deployed_contract
}

#[test]
fn who_is_interacting_with_contract() {
    let identity_contract_address = deploy_contract();
    let dispatcher = IIdentityContractDispatcher { contract_address: identity_contract_address };

    // TODO: Create 3 users (Alice, Bob, Charlie)
    let alice: ContractAddress = 1.try_into().unwrap();
    let bob: ContractAddress = 2.try_into().unwrap();
    let charlie: ContractAddress = 3.try_into().unwrap();

    // TODO: Call the `who_is_calling` function as Alice, Bob and Charlie 
    // and check if the function returns the address of the caller
    start_cheat_caller_address(identity_contract_address, alice);
    assert(dispatcher.who_is_calling() == alice, 'Alice is not the caller!');
    stop_cheat_caller_address(identity_contract_address);

    start_cheat_caller_address(identity_contract_address, bob);
    assert(dispatcher.who_is_calling() == bob, 'Bob is not the caller!');
    stop_cheat_caller_address(identity_contract_address);

    start_cheat_caller_address(identity_contract_address, charlie);
    assert(dispatcher.who_is_calling() == charlie, 'Charlie is not the caller!');
    stop_cheat_caller_address(identity_contract_address);
}

#[test]
fn test_block_timestamp_warping() {
    let identity_contract_address = deploy_contract();
    let dispatcher = IIdentityContractDispatcher { contract_address: identity_contract_address };

    let current_time = dispatcher.what_time_is_it();
    assert(current_time == 0, 'Wrong time');

    // TODO: Set the block timestamp to 100 and check if the time has changed
    start_cheat_block_timestamp(identity_contract_address, 100);
    assert(dispatcher.what_time_is_it() == 100, 'Block time was not changed');
    stop_cheat_block_timestamp(identity_contract_address);
}
