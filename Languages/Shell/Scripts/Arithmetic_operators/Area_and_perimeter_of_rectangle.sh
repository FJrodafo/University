#!/bin/bash

# Write a shell script that accepts the sides of the rectangle and prints its area and perimeter.
# Area of rectangle is the product of length and width. Perimeter is twice the sum of length and width.
# Check with length 10 and width 5. Area should be 50 and perimeter 30.

read -p "Enter the length of rectangle: " length
read -p "Enter the width of rectangle: " width

area=$(($length * $width))
perimeter=$((2 * $(($length + $width)) ))

echo "Area of the rectangle is $area"
echo "Perimeter of the rectangle is $perimeter"
