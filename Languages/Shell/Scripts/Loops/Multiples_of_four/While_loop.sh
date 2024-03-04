#!/bin/bash

# Use a while loop that will print the first ten multiples of the number four.
# First initialize a variable to 1; then, the while loop will run as long as it is less than or equal to 10.
# Inside the body of the while loop, echo command con print the value of the variable multipled by four and then it increments it by 1.

num=1

while [ $num -le 10 ]; do
    echo $(($num * 4))
    num=$(($num+1))
done
