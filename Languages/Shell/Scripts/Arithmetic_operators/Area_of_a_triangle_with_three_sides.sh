#!/bin/bash

# Write a shell script that takes the three sides of a triangle as argument and prints its area using the Heron's formula.
# Area of a triangle with sides a, b and c is calculated like this using Heron's formula:
# 
# s=(a+b+c)/2
# area=√(s*(s-a)*(s-b)*(s-c))
# 
# There is a sqrt command in bash to get square root of a number.
# For inputs 5, 4 and 3, area should be 6. For inputs 10, 4 and 8, area should be 15.19

read -p "Enter the first side: " a
read -p "Enter the second side: " b
read -p "Enter the third side: " c

s=$(echo "scale=2; ($a+$b+$c)/2" | bc)
area=$(echo "scale=2; sqrt($s*($s-$a)*($s-$b)*($s-$c))" | bc)

echo "The area of the triangle is $area"
