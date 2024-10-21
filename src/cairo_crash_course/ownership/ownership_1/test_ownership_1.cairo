use web_cairo::cairo_crash_course::ownership::ownership_1::ownership_exercise_1::{
    Position, get_value, change_value
};

#[test]
fn test_snapshots_references() {
    // TODO: Complete the tests based on the instructions file
    let mut p1 = Position { price: 3000, amount: 10 };
    let value = get_value(@p1);
    assert(value == 30000, 'Value does not match');
    change_value(ref p1);
    assert(p1.price == 10, 'Price does not match');
    assert(p1.amount == 3000, 'Amount does not match');
}
