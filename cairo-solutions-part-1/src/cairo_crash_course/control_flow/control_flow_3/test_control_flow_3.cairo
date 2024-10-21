use cairo_course_exercises::cairo_crash_course::control_flow::control_flow_3::control_flow_exercise_3::looping_conditionals;

#[test]
fn test_looping_conditionals() {
    // Do not modify the arrays!    
    let arr = array![3, 2, 4, 11, 37, 43, 100, 300];
    let arr2 = array![11, 10, 11, 11, 11, 100, 11];
    let arr3 = array![1, 1, 1, 1, 1, 1, 1, 1];
    let arr4 = array![100];
    let arr5 = array![0, 0];

    // Expected output =>
    // Iterating through an array with length 8
    // Array index = 0
    // The array element 2 is even
    // Array index = 1
    // The array element 4 is even
    // Array index = 2
    // Array index = 4
    // Array index = 5
    // The number 100 is too big, get out of here!

    // Since 11 is at index 3 function should go to the next iteration of the loop, 
    // Printing "Array index = 3" is skipped
    // The return value should be 6 as the loop breaks when element == 100, halting array iteration. 
    // The following assertion should be valid => 6 eq looping_conditionals(arr) 
    assert_eq!(6, looping_conditionals(arr));

    // Expected output =>
    // Iterating through an array with length 7
    // The array element 10 is even
    // Array index = 1
    // The number 100 is too big, get out of here!

    // The following assertion should be valid => 5 eq looping_conditionals(arr2) 
    assert_eq!(5, looping_conditionals(arr2));

    // Expected output =>
    // Iterating through an array with length 8
    // Array index = 0
    // Array index = 1
    // Array index = 2
    // Array index = 3
    // Array index = 4
    // Array index = 5
    // Array index = 6 

    // The return value should be 7. Iteration ends when i = array.length - 1.
    // The following assertion should be valid => 7 eq looping_conditionals(arr3) 
    assert_eq!(7, looping_conditionals(arr3));

    // Expected output:
    // Iterating through an array with length 1

    // Returning the first index value = 0 as iteration ended in the first condition.
    // The following assertion should be valid => 0 eq looping_conditionals(arr4)  
    assert_eq!(0, looping_conditionals(arr4));

    // Expected output =>
    // Iterating through an array with length 2
    // The array element 0 is even
    // Array index = 0  

    // The return value should be 1. Iteration ends when i = array.length - 1.
    // The following assertion should be valid => 1 eq looping_conditionals(arr5) 
    assert_eq!(1, looping_conditionals(arr5));
}
