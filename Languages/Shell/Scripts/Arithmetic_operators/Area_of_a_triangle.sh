#!/bin/bash

# Write a shell script that takes the base and height as argument and prints its area.
# Area of a triangle is 1/2 * base * height. Use the bc command to get decimal point.
# For inputs 10 and 5, area should be 25. For inputs 11 and 3, area should be 16.5

read -p "Enter the base of triangle: " base
read -p "Enter the height of triangle: " height

# scale 2 means the calculation will be up to 2 decimal places
area=$(echo "scale=2; (1/2) * $base * $height" | bc -l)

echo "Area of the triangle is $area"
