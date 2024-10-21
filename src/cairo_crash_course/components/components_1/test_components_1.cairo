use core::traits::TryInto;
use core::result::ResultTrait;
use core::traits::Into;
use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait, DeclareResultTrait,  start_cheat_caller_address, stop_cheat_caller_address,};

use web_cairo::cairo_crash_course::components::components_1::working_with_components::WorkingWithComponents;
use web_cairo::cairo_crash_course::components::components_1::working_with_components::{
    IWorkingWithComponentsDispatcher, IWorkingWithComponentsDispatcherTrait
};

// This function deploys the contract and returns the contract address and dispatcher
fn deploy_contract(deployer: ContractAddress) -> (ContractAddress, IWorkingWithComponentsDispatcher) {
    let contract_class = declare("WorkingWithComponents").unwrap().contract_class();
    let mut data_to_constructor = Default::default();
    Serde::serialize(@deployer, ref data_to_constructor);
    let (address, _) = contract_class.deploy(@data_to_constructor).unwrap();
    return (address, IWorkingWithComponentsDispatcher { contract_address: address });
}

#[test]
fn test_ownership_component_success() {
    // TODO: Create alice account and deploy the contract with it
    let alice: ContractAddress = 123.try_into().unwrap();
    let (contract_address, dispatcher) = deploy_contract(alice);

    // TODO: Assert constructor initial values in Storage
    assert(dispatcher.get_value() == 100, 'Initial value is not 100');

    // TODO: Call the update_value function with the alice account
    start_cheat_caller_address(contract_address, alice);
    dispatcher.update_value(200);
    stop_cheat_caller_address(contract_address);

    // TODO: Check that the new value is updated in Storage
    assert(dispatcher.get_value() == 200, 'Value is not updated to 200');
}

#[test]
#[should_panic]
fn test_ownership_component_fialure() {
    // TODO: Create alice account and deploy the contract with it
    let alice: ContractAddress = 123.try_into().unwrap();
    let (contract_address, dispatcher) = deploy_contract(alice);

    // TODO: Create a new address, "Bob", then try to update the storage value with Bob, expect a failure
    let bob: ContractAddress = 456.try_into().unwrap();
    start_cheat_caller_address(contract_address, bob);
    dispatcher.update_value(200);
    stop_cheat_caller_address(contract_address);
}
