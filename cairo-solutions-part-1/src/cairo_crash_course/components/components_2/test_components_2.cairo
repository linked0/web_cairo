use cairo_course_exercises::cairo_crash_course::components::components_2::mock_contract_components_2::ComponentsMockContract;
use cairo_course_exercises::cairo_crash_course::components::components_2::components_exercise_2::{
    IOperationsDispatcher, IOperationsDispatcherTrait
};
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

#[test]
fn call_and_invoke() {
    // TODO: Declare and deploy the Mock contract
    let contract = declare("ComponentsMockContract").unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();

    // TODO: Create dispatcher for the Mock contract
    let dispatcher = IOperationsDispatcher { contract_address };

    // TODO: Call dispatcher and test the assertions according to instructions
    dispatcher.set_to_zero();
    assert(dispatcher.get_value_from_storage() == 0, 'Value should be 0');

    assert(dispatcher.simple_addition(5, 6) == 11, '5 + 6 should be 11');
    assert(dispatcher.get_value_from_storage() == 11, 'Value should be 11');

    assert(dispatcher.simple_multiplication((5, 6)) == 30, '5 * 6 should be 30');

    dispatcher.increment();
    assert(dispatcher.get_value_from_storage() == 12, 'Value should be 12');
}
