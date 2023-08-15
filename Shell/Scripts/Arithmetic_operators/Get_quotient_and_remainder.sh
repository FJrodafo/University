#!/bin/bash

# Write a shell script that accepts two integers and prints the quotient and reminder for their division.
# Keep things easier by entering bigger number first and smaller number second.
# For numbers 13 and 7, quotient is 1 and reminder is 6.

read -p "Enter the first number: " dividend
read -p "Enter the second number: " divisor

quotient=$((dividend/divisor))
remainder=$((dividend%divisor))

echo "Quotient: $quotient"
echo "Remainder: $remainder"
