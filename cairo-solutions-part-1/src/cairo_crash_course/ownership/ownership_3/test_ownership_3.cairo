use cairo_course_exercises::cairo_crash_course::ownership::ownership_3::ownership_exercise_3::{
    set_value, get_value, get_name, set_name, Token
};

#[test]
fn test_set_and_get() {
    // TODO: Create a new token instance with "STRK" and 100
    let mut token = Token { name: "STRK", value: 100, };

    // TODO: Check the the data is correct using the getter functions
    assert(get_value(@token) == 100, 'The value should be 100');
    assert(get_name(@token) == "STRK", 'The name should be "STRK"');

    // TODO: Set the value to 200 and the name to "ETH"
    set_value(ref token, 200);
    set_name(ref token, "ETH");

    // TODO: Check the the data is correct using the getter functions
    assert(get_value(@token) == 200, 'The value should be 200');
    assert(get_name(@token) == "ETH", 'The name should be "ETH"');
}
