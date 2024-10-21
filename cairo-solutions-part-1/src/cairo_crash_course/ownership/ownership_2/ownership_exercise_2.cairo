use core::clone::Clone;
fn do_something(arr: Array<u32>) -> u32 {
    println!("My array item is: {}", arr[2]);
    return *arr[2];
}

fn do_something_again(arr: Array<u32>) -> u32 {
    println!("My array item (again) is: {}", arr[2]);
    return *arr[2];
}

fn my_function() {
    // TODO: Complete this function
    let arr: Array<u32> = array![10, 63, 15, 100, 53049];
    let foo = do_something(arr.clone());
    let bar = do_something_again(arr);
    assert(foo == bar, 'something went wrong!');
}
