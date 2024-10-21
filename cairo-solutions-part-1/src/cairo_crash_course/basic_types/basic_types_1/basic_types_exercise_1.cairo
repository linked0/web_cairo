fn token_status() -> felt252 {
    // TODO: Complete the functions according to instructions
    let mut my_token: u64 = 200;
    println!("My token initial value is {}", my_token);

    let mut my_token: felt252 = my_token.into();
    println!("My token value as felt252 is {}", my_token);

    my_token = 'STRK';
    println!("My token name is {}", my_token);

    {
        my_token = 500;
        println!("My token value inside the scope is {}", my_token);
    }

    my_token = 0;
    return my_token;
}
