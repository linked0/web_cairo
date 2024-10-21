use web_cairo::cairo_crash_course::advanced_types::advanced_types_4::advanced_types_exercise_4::calculate_arithmetic_series;
use web_cairo::cairo_crash_course::advanced_types::advanced_types_4::advanced_types_exercise_4::calculate_geometric_series;

#[test]
fn test_calculate_arithmetic_series() {
    // TODO: Test with start 3, count 5, and difference 2
    let returned_array = calculate_arithmetic_series(3, 5, 2);
    let expected_arr = array![3, 5, 7, 9, 11];
    assert_eq!(returned_array, expected_arr, "calculate_arithmetic_series(3, 5, 2) returned wrong values");

    // TODO: Test with start 0, count 4, and difference 3
    let returned_array = calculate_arithmetic_series(0, 4, 3);
    let expected_arr = array![0, 3, 6, 9];
    assert_eq!(returned_array, expected_arr, "calculate_arithmetic_series(0, 4, 3) returned wrong values");

    // TODO: Test with start 5, count 3, and difference 5
    let returned_array = calculate_arithmetic_series(5, 3, 5);
    let expected_arr = array![5, 10, 15];
    assert_eq!(returned_array, expected_arr, "calculate_arithmetic_series(5, 3, 5) returned wrong values");
}

#[test]
fn test_calculate_geometric_series() {
    // TODO: Test with start 2, count 4, and ratio 3
    let returned_array = calculate_geometric_series(2, 4, 3);
    let expected_arr = array![2, 6, 18, 54];
    assert_eq!(returned_array, expected_arr, "calculate_gerometric_series(2, 4, 3) returned wrong values");

    // TODO: Test with start 1, count 5, and ratio 2
    let returned_array = calculate_geometric_series(1, 5, 2);
    let expected_arr = array![1, 2, 4, 8, 16];
    assert_eq!(returned_array, expected_arr, "calculate_gerometric_series(1, 5 , 2) returned wrong values");

    // TODO: Test with start 3, count 3, and ratio 4
    let returned_array = calculate_geometric_series(3, 3, 4);
    let expected_arr = array![3, 12, 48];
    assert_eq!(returned_array, expected_arr, "calculate_gerometric_series(3, 3, 4) returned wrong values");
}
