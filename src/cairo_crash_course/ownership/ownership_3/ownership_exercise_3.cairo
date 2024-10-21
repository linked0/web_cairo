// TODO: Define the struct
#[derive(Drop)]
struct Token {
    name: ByteArray,
    value: u32,
}

// TODO: Implement the `get_value` function
fn get_value(token: @Token) -> u32 {
    println!("The value is: {}", *token.value);
    return *token.value;
}

// TODO: Implement the `get_name` function
fn get_name(token: @Token) -> ByteArray {
    println!("The name is: {}", token.name);
    return format!("{}", token.name);
}

// TODO: Implement the `set_name` function
fn set_name(ref token: Token, new_name: ByteArray) {
    token.name = new_name;
}

// TODO: Implement the `set_value` function
fn set_value(ref token: Token, new_value: u32) {
    token.value = new_value;
}
