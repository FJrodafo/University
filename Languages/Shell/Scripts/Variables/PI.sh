#!/bin/bash

# Write a command that prints the value of Pi.
# Demostrate that it should not be changeable:
readonly PI=3.14159

# We can't change PI value because it is a readonly variable.
PI=3.5

echo "Pi value is $PI"
