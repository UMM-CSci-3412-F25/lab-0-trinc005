#!/bin/bash

NTHPRIME="NthPrime.tgz" #Assigning NthPrime.tgz to a varible.
NUM=$1			#Assigning the argument needed to a varible.
DIR="./NthPrime"	#Assigning the directory that we will enter to a varible.

if [ -f "$NTHPRIME" ]; then #Using and if function to insure if anything does go wrong that
  tar -xzf "$NTHPRIME"	    #it wont mess up anything i have been working on.
else			    #Uses tar with -xzf to unzip directly into the pwd.
  exit 1
fi

if [ -d "$DIR" ]; then	   #first checks that the directoy that was previously tared exists
  cd "$DIR"		   #then if it dosent it will exit, and if it does then it will go into that
else			   #directory.
  exit 1
fi

if [ -f "main.c" ]; then		   #Checks to see just one file, which is all we need, exists.
  gcc "main.c" "nth_prime.c" -o "NthPrime" #If it does then it will compile both into NthPrime (Executable).
else
  exit 1
fi


EXECUTABLE="./NthPrime" #Assingns to the executable. Here I could of used $DIR too but decided not to.


if [ -n "$NUM" ]; then #Checks first to see if there is a number present as an argument.
  "$EXECUTABLE" "$NUM" #If there exists a number in the argument then it will execute using that number.
else
  exit 1
fi



