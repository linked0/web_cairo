use starknet::ContractAddress;
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait,  start_cheat_caller_address, stop_cheat_caller_address, start_cheat_block_timestamp};
use web_cairo::cairo_crash_course::first_cairo_contract::first_cairo_contract_1::first_cairo_contract::IMyFirstCairoContractDispatcher;
use web_cairo::cairo_crash_course::first_cairo_contract::first_cairo_contract_1::first_cairo_contract::IMyFirstCairoContractDispatcherTrait;

#[test]
fn first_cairo_contract_tests() {
    // Deploy the contract
    let contract_class = declare("MyFirstCairoContract").unwrap().contract_class();

    // Prepare constuctor calldata
    let initial_value: u256 = 120;
    let mut constructor_calldata = Default::default();
    Serde::serialize(@initial_value, ref constructor_calldata);

    // Deploying the contract, and getting the address
    let (address, _) = contract_class.deploy(@constructor_calldata).unwrap();
    let first_contract_dispatcher = IMyFirstCairoContractDispatcher { contract_address: address };

    // Check initial state
    assert(initial_value == first_contract_dispatcher.get_number(), 'Wrong number in storage!');

    // Use set number to update the number
    let new_number: u256 = 1337;
    first_contract_dispatcher.set_number(new_number);
    // Check that the number was changed
    assert(new_number == first_contract_dispatcher.get_number(), 'Wrong number in storage!');
}
