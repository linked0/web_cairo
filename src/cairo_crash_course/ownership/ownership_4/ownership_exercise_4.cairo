// TODO: Implement the function `multiply_elements` that takes a snapshot of an array of u32
// and returns the product of all elements in the array.
// Note: Don't forget to use span and pop_front to iterate over the array.
fn multiply_elements(my_array: @Array<u32>) -> u32 {
    let mut span = my_array.span();
    let mut product = 1;

    // Calculate the product of all elements in the array
    while span.len() > 0 {
        product *= *span.pop_front().unwrap();
    };

    return product;
}
