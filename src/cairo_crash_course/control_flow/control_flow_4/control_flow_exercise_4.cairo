#[derive(Drop)]
pub struct MY_STRUCT {
    pub product: u32,
    pub my_array: Array<u32>
}

// TODO: Complete the function to solve the exercise.
pub fn using_while(my_struct: MY_STRUCT) -> u32 {
    let mut i = 0;
    let mut result = my_struct.product;

    while i < my_struct.my_array.len() {
        result = result * *my_struct.my_array.at(i);
        i += 1;
    };

    println!("The result is {}", result);
    return result;
}
