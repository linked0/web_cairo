// TODO: Implement the Enum that is described in the instructions
#[derive(Copy, Drop)]
enum Data {
    Integer: u128,
    Felt: felt252,
    Tuple: (u32, u32),
}

// TODO: Define the processing trait
trait Processing {
    fn process(self: Data);
}

// TODO: Implement the Processing trait for the Data enum
impl ProcessingImpl of Processing {
    fn process(self: Data) {
        match self {
            Data::Integer(value) => { println!("My Super Integer! {}", value) },
            Data::Felt(value) => { println!("Wonderful Felt! {}", value) },
            Data::Tuple((x, y)) => { println!("The Amazing Tuple! x:{} y:{}", x, y) },
        }
    }
}


fn ultimate_array(get_index: u32, my_array: @Array<Data>) -> Data {
    // TODO: Complete the function according to the instructions
    if (get_index >= my_array.len()) {
        panic!("What a Panic!");
    }

    let value = *my_array.at(get_index);
    value.process();

    return *my_array.at(get_index);
}
