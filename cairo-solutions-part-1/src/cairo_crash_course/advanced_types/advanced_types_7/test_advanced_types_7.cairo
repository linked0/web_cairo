use cairo_course_exercises::cairo_crash_course::advanced_types::advanced_types_7::advanced_types_exercise_7::{
    SimpleMap, ISimpleMap, ISimpleMapDispatcher, ISimpleMapDispatcherTrait
};
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

#[test]
fn test_simple_map() {
    // TODO: Decalre the contract, deploy it, and create a dispatcher
    let contract = declare("SimpleMap").unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    let dispatcher = ISimpleMapDispatcher { contract_address };

    // TODO: Test the contract functions according to the instructions
    // ETH
    dispatcher.add_token('ETH');
    assert(dispatcher.is_token_in_storage('ETH'), 'ETH should be in storage');
    assert(dispatcher.is_token_in_storage('WBTC') == false, 'WBTC should not be in storage');
    // STRK
    dispatcher.add_token('STRK');
    assert(dispatcher.is_token_in_storage('STRK'), 'STRK should be in storage');
    // USDC
    dispatcher.add_token('USDC');
    assert(dispatcher.is_token_in_storage('USDC'), 'USDC should be in storage');
    // DOGE
    dispatcher.add_token('DOGE');
    assert(dispatcher.is_token_in_storage('DOGE'), 'DOGE should be in storage');
}
