fn looping_conditionals(array_of_numbers: Array<u128>) -> u32 {
    // Use this variable as index
    let mut i: u32 = 0;
    println!("Iterating through an array with length {}", array_of_numbers.len());

    // Tip 1: Access an array element at the location i - `*my_array.at(i)`
    // Tip 2: Check the array's length - `my_array.len()``

    // TODO: Complete the loop according to the instructions
    loop {
        if i == array_of_numbers.len() - 1 {
            break;
        }

        if *array_of_numbers.at(i) == 100 {
            println!("The number 100 is too big, get out of here!");
            break;
        }

        if (*array_of_numbers.at(i) % 2 == 0) {
            println!("The array element {} is even!", *array_of_numbers.at(i));
        }

        if *array_of_numbers.at(i) == 11 {
            i += 1;
            continue;
        }

        println!("Array index: {}", i);
        i += 1;
    };

    println!("");

    return i;
}
