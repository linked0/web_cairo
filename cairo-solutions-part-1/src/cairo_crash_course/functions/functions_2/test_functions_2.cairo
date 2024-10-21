use cairo_course_exercises::cairo_crash_course::functions::functions_2::functions_exercise_2::is_perfect;

#[test]
fn test_is_perfect() {
    assert_eq!(false, is_perfect(0));
    assert_eq!(false, is_perfect(1));
    assert_eq!(true, is_perfect(6));
    assert_eq!(false, is_perfect(7));
    assert_eq!(false, is_perfect(8));
    assert_eq!(true, is_perfect(28));
    assert_eq!(false, is_perfect(29));
    assert_eq!(true, is_perfect(8128));
}
