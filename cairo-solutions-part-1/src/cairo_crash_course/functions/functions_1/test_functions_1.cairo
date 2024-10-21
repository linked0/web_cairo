use cairo_course_exercises::cairo_crash_course::functions::functions_1::functions_exercise_1::my_investments;
use cairo_course_exercises::cairo_crash_course::functions::functions_1::functions_exercise_1::my_investments_tuple;
use cairo_course_exercises::cairo_crash_course::functions::functions_1::functions_exercise_1::my_investments_struct;

#[test]
fn test_value_calculation() {
    assert_eq!(40000, my_investments());
    assert_eq!(40000, my_investments_tuple());
    assert_eq!(40000, my_investments_struct());
}
