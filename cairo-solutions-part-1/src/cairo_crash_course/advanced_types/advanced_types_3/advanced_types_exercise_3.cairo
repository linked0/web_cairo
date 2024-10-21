fn calculate_multiples(base: u256, count: u256) -> Array<u256> {
    // TODO: Initialize an empty array to store the multiples
    let mut my_arr = ArrayTrait::<u256>::new();

    // TODO: Loop through the count and pupolate the array with the multiples
    let mut index = 1;
    while index <= count {
        my_arr.append(base * index);
        index += 1;
    };

    // TODO: Return the array
    return my_arr;
}
