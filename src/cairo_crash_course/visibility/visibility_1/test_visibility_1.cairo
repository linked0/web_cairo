// These imports will allow us to directly access and set the contract state - for `balance` storage variable access
// use web_cairo::cairo_crash_course::visibility::visibility_1::visibility_exercise_1::SimpleBalance::fundsContractMemberStateTrait;
use web_cairo::cairo_crash_course::visibility::visibility_1::visibility_exercise_1::SimpleBalance::{
    InternalTrait, _add_funds
};
use web_cairo::cairo_crash_course::visibility::visibility_1::visibility_exercise_1::SimpleBalance;
use snforge_std::{declare, ContractClassTrait};

#[test]
fn test_internal() {
    // TODO: Retreive the state of the contract using Starknet Foundry
    // https://foundry-rs.github.io/starknet-foundry/testing/testing_contract_internals.html?highlight=contract_state_for_testing
    let mut state = SimpleBalance::contract_state_for_testing();
    state.funds.write(10);

    // TODO: Call the function `_get_funds` from the contract and make sure it returns the correct value
    let value = state._get_funds();
    assert(value == 10, 'faield to set the value');

    // TODO: Call the function `_add_funds` from the contract and make sure 
    // it returns the correct value & state is updated
    let other_value = _add_funds(ref state, 300);
    assert(other_value == 310, 'Incorrect other_value returned');
    assert(state.funds.read() == 310, 'Incorrect state value');
}
