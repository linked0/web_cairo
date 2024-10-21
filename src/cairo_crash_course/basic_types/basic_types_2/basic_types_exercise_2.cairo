// TODO: Complete the file using the instructions provided

const TOTAL_SUPPLY: u32 = 300;
const SYMBOL: felt252 = 'STRK';
const MESSAGE: felt252 = 'Cairo rulez';

pub fn get_supply() -> u32 {
    return TOTAL_SUPPLY;
}

pub fn get_symbol() -> felt252 {
    return SYMBOL;
}

pub fn get_message() -> felt252 {
    return MESSAGE;
}
