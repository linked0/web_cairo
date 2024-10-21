use core::result::ResultTrait;
use core::zeroable::Zeroable;

// These two following imports are needed for dispatcher
use web_cairo::cairo_crash_course::starknet_foundry::starknet_foundry_1::value_contract::IValueContractDispatcher;
use web_cairo::cairo_crash_course::starknet_foundry::starknet_foundry_1::value_contract::IValueContractDispatcherTrait;

use starknet::ContractAddress;
use snforge_std::{declare, DeclareResultTrait, ContractClassTrait};

fn deploy_contract() -> ContractAddress {
    // TODO: Declare the class of the contract
    let contract = declare("ValueContract").unwrap().contract_class();

    // TODO: Deploy the contract and unwrap the result
    // Tip: ArrayTrait is used for the empty constructor arguments
    // You need to unwrap the result to get ContractAddress
    let (contract_address, _) = contract.deploy(@array![]).unwrap();

    // TODO: Return the address of the deployed contract
    return contract_address;
}

#[test]
fn test_deploy_contract() {
    let contract_address = deploy_contract();

    // TODO: Assert that the contract address is not zero
    assert(contract_address.is_non_zero(), 'Contract is not deployed');
}

#[test]
fn test_add_value() {
    let contract_address = deploy_contract();

    // TODO: Create a dispatcher for the contract
    let dispatcher = IValueContractDispatcher { contract_address };

    // TODO: Add 5 to the variable value in the contract
    dispatcher.add_value(5);

    // TODO: Check that the value stored in contract is 5
    assert(dispatcher.get_value() == 5, 'Value is not 5');
}
