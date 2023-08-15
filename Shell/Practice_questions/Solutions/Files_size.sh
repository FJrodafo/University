#!/bin/bash

for i in $(ls -S1); do
    echo $i: $(du -sh "$i" | cut -f1)
done
