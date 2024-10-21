// TODO: Complete the functions according to instructions
fn my_investments() -> u64 {
    let price_in_usd = 1000;
    let tokens_strk = 40;
    let tokens_value = calculate_value(tokens_strk, price_in_usd);
    println!("My tokens value are {}", tokens_value);
    return tokens_value;
}

fn calculate_value(amount: u64, price: u64) -> u64 {
    amount * price
}

// TODO: Refactor the my_investments function, a tuple
fn my_investments_tuple() -> u64 {
    let tokens_and_price = (40, 1000);
    let tokens_value = calculate_value_tuple(tokens_and_price);
    println!("My tokens value are {} (tuple function)", tokens_value);
    return tokens_value;
}

fn calculate_value_tuple(value: (u64, u64)) -> u64 {
    let (amount, price) = value;
    amount * price
}

// TODO: Refactor the my_investments function, using struct
struct STRK_data {
    amount: u64,
    price: u64
}

fn my_investments_struct() -> u64 {
    let tokens_and_price = STRK_data { amount: 40, price: 1000 };
    let tokens_value = calculate_value_struct(tokens_and_price);
    println!("My tokens value are {} (struct function)", tokens_value);
    return tokens_value;
}

fn calculate_value_struct(strk_data: STRK_data) -> u64 {
    strk_data.amount * strk_data.price
}
