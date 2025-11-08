#!/bin/bash

# check we got exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 N"
    exit 1
fi

N="$1"

# 1) extract NthPrime.tgz into current directory
tar -xzf NthPrime.tgz

# 2) go into the NthPrime directory
cd NthPrime || { echo "NthPrime directory not found"; exit 1; }

# 3) compile the C program(s) into an executable called NthPrime
gcc -o NthPrime *.c

# 4) run the executable with the script’s argument
./NthPrime "$N"



