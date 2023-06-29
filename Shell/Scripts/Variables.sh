#!/bin/bash

today=$(date)
echo "Today's date is $today"

echo "What is your full name?"
read name
echo "Hello, $name"

echo "What is your age?"
read age
echo "So you are $age years old"

readonly PI=3.14159
# We can't change PI value because
# it is a readonly variable
PI=3.5
echo "Pi value is $PI"
