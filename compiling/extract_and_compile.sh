#!/bin/bash

NTHPRIME="NthPrime.tgz"
NUM=$1
DIR="./NthPrime"

if [ -f "$NTHPRIME" ]; then
  tar -xzf "$NTHPRIME"
else
  exit 1
fi

if [ -d "$DIR" ]; then
  cd "$DIR"
 # echo $PWD
else
  exit 1
fi

if [ -f "main.c" ]; then
  gcc "main.c" "nth_prime.c" -o "NthPrime"
  cd "./compiling"
else
  exit 1
fi

#EXECUTABLE="/home/trinc005/Documents/lab-0-trinc005/compiling/NthPrime/NthPrime"
#ARG="$NUM"

#if [ -n "$ARG" ]; then
#  "$EXECUTABLE" "$ARG"
#else
 # exit 1
#fi


./NthPrime "$NUM"
