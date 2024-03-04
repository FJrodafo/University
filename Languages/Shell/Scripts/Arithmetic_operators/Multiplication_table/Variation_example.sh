#!/bin/bash

# Write a shell script that accepts an integer and prints its multiplication table.
# Don't use loops at this stage. Simply multiply it by numbers one by one.

read -p "Multiplication table for: " input
number=$((input))

echo "$number * 1 = $number"
echo "$number * 2 = $(($number*2))"
echo "$number * 3 = $(($number*3))"
echo "$number * 4 = $(($number*4))"
echo "$number * 5 = $(($number*5))"
echo "$number * 6 = $(($number*6))"
echo "$number * 7 = $(($number*7))"
echo "$number * 8 = $(($number*8))"
echo "$number * 9 = $(($number*9))"
echo "$number * 10 = $(($number*10))"
