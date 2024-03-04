#!/bin/bash

# Write a shell script that accepts a directory name called hello and creates it if it doesn't exist already.
# Switch to this directory and create a new file named new.txt

mkdir -p $1
cd $1
touch new.txt
