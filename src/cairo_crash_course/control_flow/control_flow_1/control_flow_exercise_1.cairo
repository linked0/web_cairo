pub fn practice_if() -> u32 {
    let l33t = 1337;
    let not_l33t = 0;
    let always_the_truth = true;

    // TODO: implement the assigment of variable message using an if expression
    let message = if always_the_truth {
        l33t
    } else {
        not_l33t
    };

    if true {
        println!("U d0n7 kn0 {}, n00b?", message);
    }

    return message;
}
