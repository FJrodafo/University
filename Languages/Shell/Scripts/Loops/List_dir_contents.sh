#!/bin/bash

# Output all the files and directory that exists under the /var directory.
# Use /var/* as the range of the for loop to increment through.

for i in /var/*; do
    echo $i
done
