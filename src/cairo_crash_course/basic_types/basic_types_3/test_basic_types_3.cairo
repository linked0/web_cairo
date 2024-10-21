use web_cairo::cairo_crash_course::basic_types::basic_types_3::basic_types_exercise_3::add_felt;
use web_cairo::cairo_crash_course::basic_types::basic_types_3::basic_types_exercise_3::subtract_felt;
use web_cairo::cairo_crash_course::basic_types::basic_types_3::basic_types_exercise_3::multiply_felt;
use web_cairo::cairo_crash_course::basic_types::basic_types_3::basic_types_exercise_3::divide_felt;

#[test]
fn test_operations() {
    assert(add_felt(('cairo', 'rulez')) == 918432372713, 'Sum ok');
    assert(subtract_felt(10, 1) == 9, 'Subtraction ok');
    assert(multiply_felt(10, 10) == 100, 'Multiplication ok');
    assert(divide_felt(1337, 1338) == 0, 'Division ok');
}

#[test]
#[should_panic]
fn test_substraction_panic() {
    subtract_felt(10, 11);
}
