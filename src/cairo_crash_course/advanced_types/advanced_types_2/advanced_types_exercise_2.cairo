fn build_arrays() {
    // Todo: Create and array of felts and append items according to the instructions
    let mut my_arr = ArrayTrait::<felt252>::new();
    my_arr.append('foo');
    my_arr.append(1337);
    my_arr.append('Cairo rulez');

    // Todo: Retreive and print array elements
    println!("First array element: {}", *my_arr.at(0));
    println!("Second array element: {}", *my_arr.at(1));
    println!("Third array element: {}", *my_arr.at(2));

    // Todo: Make sure the array elements have the right values with assert
    assert!(*my_arr.at(0) == 'foo', "First element is not 'foo'");
    assert!(*my_arr.at(1) == 1337, "Second element is not 1337");
    assert!(*my_arr.at(2) == 'Cairo rulez', "Third element is not 'Cairo rulez'");
}
