// TODO: Implement the function
// start: 1, count: 5, difference: 2 --> [1, 3, 5, 7, 9]
fn calculate_arithmetic_series(start: u256, count: u32, difference: u256) -> Array<u256> {
    // TODO: Initialize an empty array to store the series
    let mut arithmetic_series = ArrayTrait::<u256>::new();
    arithmetic_series.append(start);

    // TODO: Loop through the count and populate the array with the series
    let mut index = 0;
    while index < count - 1 {
        arithmetic_series.append(*arithmetic_series.at(index) + difference);
        index += 1;
    };

    // TODO: Return the array
    return arithmetic_series;
}

// TODO: Implement the function
fn calculate_geometric_series(start: u256, count: u32, ratio: u256) -> Array<u256> {
    // TODO: Initialize an empty array to store the series
    let mut geometric_series = ArrayTrait::<u256>::new();
    geometric_series.append(start);

    // TODO: Loop through the count and populate the array with the series
    let mut index = 0;
    while index < count - 1 {
        geometric_series.append(*geometric_series.at(index) * ratio);
        index += 1;
    };

    // TODO: Return the array
    return geometric_series;
}

