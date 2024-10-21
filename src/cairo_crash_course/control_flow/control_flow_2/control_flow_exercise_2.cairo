fn conditional_counter() -> u32 {
    let mut index = 0;

    // TODO: Complete the loop according to the instructions
    loop {
        if (index > 20) {
            break;
        }

        if (index == 10) {
            index += 1;
            continue;
        }

        println!("index value is {}", index);

        index += 2;
    };

    return index;
}
