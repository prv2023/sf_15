#!/bin/bash

echo "Enter a number:"
read num

# Function to check if a number is prime
is_prime() {
    local n=$1
    if [ $n -lt 2 ]; then
        return 1  # Not a prime number
    fi

    for ((i = 2; i * i <= n; i++)); do
        if [ $((n % i)) -eq 0 ]; then
            return 1  # Not a prime number
        fi
    done

    return 0  # Prime number
}

# Call the function and check the result
is_prime $num

if [ $? -eq 0 ]; then
    echo "$num is a prime number."
else
    echo "$num is not a prime number,its consecutive."
fi
