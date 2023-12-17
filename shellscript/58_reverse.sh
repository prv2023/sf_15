#!/bin/bash

echo "Enter a number:"
read num

reverse=0

while [ $num -gt 0 ]; 
do
    digit=$((num % 10))   #extracts last digit
    reverse=$((reverse * 10 + digit))  
    #Builds the reversed number by appending the extracted digit to the reversed number (after shifting it left by one decimal place).
    
    num=$((num / 10))  #deletes last digit
done

echo "Reversed number: $reverse"
