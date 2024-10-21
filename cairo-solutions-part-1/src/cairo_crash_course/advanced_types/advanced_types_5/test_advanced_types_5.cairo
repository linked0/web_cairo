use cairo_course_exercises::cairo_crash_course::advanced_types::advanced_types_5::advanced_types_exercise_5::Processing;
use cairo_course_exercises::cairo_crash_course::advanced_types::advanced_types_5::advanced_types_exercise_5::ultimate_array;
use cairo_course_exercises::cairo_crash_course::advanced_types::advanced_types_5::advanced_types_exercise_5::Data;

#[test]
fn test_ultimate_array() {
    // TODO: Invoke the custom type array
    // Expected output =>
    // My Super Integer! 1337
    // Wonderful Felt! 20853259421949790336263223841
    // The Amazing Tuple! 6713199, 6447474
    let mut our_array = ArrayTrait::<Data>::new();
    our_array.append(Data::Integer(1337));
    our_array.append(Data::Felt('Cairo rulez!'));
    our_array.append(Data::Tuple(('foo', 'bar')));

    ultimate_array(0, @our_array);
    ultimate_array(1, @our_array);
    ultimate_array(2, @our_array);
}

// TODO: Test the panic!
#[test]
#[should_panic]
fn test_panic() {
    let mut our_array = ArrayTrait::<Data>::new();
    our_array.append(Data::Integer(1337));
    our_array.append(Data::Felt('Cairo rulez!'));
    our_array.append(Data::Tuple(('foo', 'bar')));

    ultimate_array(3, @our_array);
}
