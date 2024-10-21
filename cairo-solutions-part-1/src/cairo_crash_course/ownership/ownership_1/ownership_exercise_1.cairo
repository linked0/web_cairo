// TODO: Create a `Struct` according to the instructions file
#[derive(Copy, Drop)]
struct Position {
    price: u32,
    amount: u32,
}

// TODO: Create a `get_value` function according to the instructions file
fn get_value(pos: @Position) -> u32 {
    return *pos.price * *pos.amount;
}

// TODO: Create a `change_value` function according to the instructions file
fn change_value(ref p1: Position) {
    let temp = p1.price;
    p1.price = p1.amount;
    p1.amount = temp;
}
