#!/bin/bash

# Create a string variable called arch and initialize its value to "and Awesome!". Now join strings distro and arch inside a third variable. Print it.
# If the third variable name is merge, use merge=$distro$arch

distro="Arch Linux is cool"
echo $distro

arch=" and Awesome!"
echo 'Merging with " and Awesome!"'

merge=$distro$arch
echo $merge
