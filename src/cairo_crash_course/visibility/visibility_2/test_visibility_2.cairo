use web_cairo::cairo_crash_course::visibility::visibility_2::visibility_exercise_2::{
    FunctionVisibility, IFunctionVisibilityLibraryDispatcher, IFunctionVisibilityDispatcherTrait
};
// use web_cairo::cairo_crash_course::visibility::visibility_2::visibility_exercise_2::FunctionVisibility::valueContractMemberStateTrait
use web_cairo::cairo_crash_course::visibility::visibility_2::visibility_exercise_2::FunctionVisibility::InternalFunctionTrait;
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

#[test]
fn test_internal_external() {
    // TODO: Declare the contract and get the class_hash
    let class_hash = *(declare("FunctionVisibility").unwrap().contract_class().class_hash);

    // TODO: Use Create a contract dispatcher
    let dispatcher = IFunctionVisibilityLibraryDispatcher { class_hash };

    // TODO: get the contract state (will be used for testing internal functions)
    let mut state = FunctionVisibility::contract_state_for_testing();

    // TODO: Make sure that the public read_value() function returns the same value that is in the state
    assert_eq!(dispatcher.read_value(), state.value.read(), "The value returned by read_value() is not the same as the value in the state");

    // TODO: Call the public set_value() function to update the storage value
    dispatcher.set_value(10);

    // TODO: Make sure that the value in the state and the value returned by read_value() are updated
    assert_eq!(dispatcher.read_value(), 10, "The value returned by read_value() wasn't updated after calling set_value()");
    assert_eq!(state.value.read(), 10, "The value in the state wasn't updated after calling set_value()");

    // TODO: Update the storage value using the contract state
    state.value.write(20);

    // TODO: Make sure that the value in the state and the value returned by read_value() are updated
    assert_eq!(dispatcher.read_value(), 20, "The value returned by read_value() is not updatd after low-level state update");
    assert_eq!(state.value.read(), 20, "The value stored in the state is not updatd after low-level state update");
}
