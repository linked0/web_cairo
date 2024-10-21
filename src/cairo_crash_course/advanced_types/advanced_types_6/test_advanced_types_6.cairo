use web_cairo::cairo_crash_course::advanced_types::advanced_types_6::advanced_types_exercise_6::{
    SimpleList, ISimpleList, ISimpleListDispatcher, ISimpleListDispatcherTrait
};
use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

#[test]
fn test_simple_list() {
    // TODO: Declare, deploy and create a dispatcher for the SimpleList contract
    let contract = declare("SimpleList").unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    let dispatcher = ISimpleListDispatcher { contract_address };

    // TODO: Trigger the odd_or_even function with the numbers 2, 4, 1, 3, and check the results using the get_number_by_index function
    dispatcher.odd_or_even(2);
    assert(dispatcher.get_number_by_index('even', 0) == 2, '2 should be in the even list');
    dispatcher.odd_or_even(4);
    assert(dispatcher.get_number_by_index('even', 1) == 4, '4 should be in the even list');
    dispatcher.odd_or_even(1);
    assert(dispatcher.get_number_by_index('odd', 0) == 1, '1 should be in the odd list');
    dispatcher.odd_or_even(3);
    assert(dispatcher.get_number_by_index('odd', 1) == 3, '3 should be in the odd list');
}
