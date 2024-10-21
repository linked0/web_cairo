# Hints

## Functions - Exercise 2 - Chasing perfection
It might be helpful to revisit the Control Flow and Functions topics from the crash course. 👀

Here are some tips to guide you through this exercise:

- Begin by implementing a loop using a mutable variable `index`, starting at 1.
- Create another mutable variable `sum` to store the sum, starting at 0.
- Check if `index` is equal to `number - 1`. If true, break the loop and return `number == sum`.
- Next, check if `number % index` equals `0`. If it does, add index to the sum.
- Finally, at the end of the loop, increment the value of index by 1 to proceed to the next iteration.