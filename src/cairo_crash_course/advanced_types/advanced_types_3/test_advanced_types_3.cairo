use web_cairo::cairo_crash_course::advanced_types::advanced_types_3::advanced_types_exercise_3::calculate_multiples;

#[test]
fn test_calculate_multiples() {
    // TODO: Test with base 3 and count 5
    let returned_array = calculate_multiples(3, 5);
    let expected_arr = array![3, 6, 9, 12, 15];
    assert_eq!(returned_array, expected_arr, "Mutiples array for base 3 and count 5 is incorrect");

    // TODO: Test with base 5 and count 3
    let returned_array = calculate_multiples(5, 3);
    let expected_arr = array![5, 10, 15];
    assert_eq!(returned_array, expected_arr, "Mutiples array for base 5 and count 3 is incorrect");

    // TODO: Test with base 10 and count 4
    let returned_array = calculate_multiples(10, 4);
    let expected_arr = array![10, 20, 30, 40];
    assert_eq!(returned_array, expected_arr, "Mutiples array for base 10 and count 4 is incorrect");
}
