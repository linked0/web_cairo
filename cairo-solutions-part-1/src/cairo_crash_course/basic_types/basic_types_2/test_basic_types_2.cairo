use cairo_course_exercises::cairo_crash_course::basic_types::basic_types_2::basic_types_exercise_2::get_message;
use cairo_course_exercises::cairo_crash_course::basic_types::basic_types_2::basic_types_exercise_2::get_supply;
use cairo_course_exercises::cairo_crash_course::basic_types::basic_types_2::basic_types_exercise_2::get_symbol;

#[test]
fn test_getters() {
    assert(300 == get_supply(), 'get_supply return value issue');
    assert(1398035019 == get_symbol(), 'get_symbol return value issue');
    assert(81458044616991368501028218 == get_message(), 'get_message return value issue');
}
