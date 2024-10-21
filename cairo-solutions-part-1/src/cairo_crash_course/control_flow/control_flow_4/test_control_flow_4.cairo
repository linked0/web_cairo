use cairo_course_exercises::cairo_crash_course::control_flow::control_flow_4::control_flow_exercise_4::{using_while, MY_STRUCT};

#[test]
fn test_while_loop() {
    let strk = MY_STRUCT { product: 1, my_array: array![11, 12, 4, 3] };
    assert(using_while(strk) == 1584, 'Incorrect value');
    let strk_2 = MY_STRUCT { product: 2, my_array: array![11, 12, 4, 3] };
    assert(using_while(strk_2) == 3168, 'Incorrect value');
    let strk = MY_STRUCT { product: 7, my_array: array![1337, 11, 3, 30] };
    assert(using_while(strk) == 9265410, 'Incorrect value');
    let strk = MY_STRUCT { product: 2, my_array: array![1, 2, 3, 4] };
    assert(using_while(strk) == 48, 'Incorrect value');
}
