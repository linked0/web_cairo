// TODO: Complete the function according to instructions
pub fn is_perfect(number: u128) -> bool {
    if number == 0 {
        return false;
    }

    if number == 1 {
        return false;
    }

    let mut index = 1;
    let mut sum = 0;

    return loop {
        if index == number {
            break number == sum;
        }

        if number % index == 0 {
            sum += index;
        }

        index += 1
    };
}
