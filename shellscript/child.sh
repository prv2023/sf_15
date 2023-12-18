# Function to sort array elements in descending order
sort_descending() {
    array=("$@")
    n=${#array[@]}
    
    for ((i=0; i<n-1; i++))
    do
        for ((j=0; j<n-i-1; j++))
        do
            if ((array[j] < array[j+1]))
            then
                temp=${array[j]}
                array[j]=${array[j+1]}
                array[j+1]=$temp
            fi
        done
    done
    
    echo "Sorted array in descending order: ${array[@]}"
}

# Function to sort array elements in ascending order
sort_ascending() {
    array=("$@")
    n=${#array[@]}
    
    for ((i=0; i<n-1; i++))
    do
        for ((j=0; j<n-i-1; j++))
        do
            if ((array[j] > array[j+1]))
            then
                temp=${array[j]}
                array[j]=${array[j+1]}
                array[j+1]=$temp
            fi
        done
    done
    
    echo "Sorted array in ascending order: ${array[@]}"
}

# Main script
array=(5 2 9 1 7)
echo "Original array: ${array[@]}"

# Fork a child process
child_pid=$$
if ((child_pid == 0))
then
    # Child process
    sort_ascending "${array[@]}"
else
    # Parent process
    sort_descending "${array[@]}"
fi
