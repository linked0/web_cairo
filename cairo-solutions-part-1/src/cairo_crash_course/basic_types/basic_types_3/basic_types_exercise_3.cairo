use core::option::OptionTrait;
use core::traits::TryInto;

// TODO: Implement add_felt
fn add_felt(value: (felt252, felt252)) -> felt252 {
    let (x, y) = value;
    return x + y;
}

// TODO: Implement subtract_felt
fn subtract_felt(x: felt252, y: felt252) -> u8 {
    let result: felt252 = x - y;
    let result_u8: u8 = result.try_into().unwrap();
    return result_u8;
}

// TODO: Implement multiply_felt
fn multiply_felt(x: u32, y: felt252) -> u32 {
    return x * y.try_into().unwrap();
}

// TODO: Implement divide_felt
fn divide_felt(x: u64, y: u64) -> felt252 {
    return (x / y).try_into().unwrap();
}
