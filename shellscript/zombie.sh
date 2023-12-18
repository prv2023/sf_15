#!/bin/bash

count_vowels() {
    local sentence=$1
    local count=0

    for ((i=0; i<${#sentence}; i++)); do
        char="${sentence:$i:1}"
        if [[ $char == [aeiouAEIOU] ]]; then
            ((count++))
        fi
    done

    echo "Number of vowels in the sentence: $count"
}

count_words() {
    local sentence=$1
    local count=0
    local is_word=0

    for ((i=0; i<${#sentence}; i++)); do
        char="${sentence:$i:1}"
        if [[ $char == [[:space:]] || $char == $'\t' || $char == $'\n' ]]; then
            is_word=0
        elif ((is_word == 0)); then
            ((count++))
            is_word=1
        fi
    done

    echo "Number of words in the sentence: $count"
}

# Prompt user to enter a sentence
read -p "Enter a sentence: " user_sentence

# Count vowels
count_vowels "$user_sentence"

# Fork and count words in the child process
user_sentence=$(echo "$user_sentence" | tr -d '\n')  # Remove newlines
(user_sentence="$user_sentence"; count_words "$user_sentence") &

# Introduce an orphan process
(orphan_pid=$BASHPID; sleep 2; echo "Orphan process (PID: $orphan_pid) running") &

# Introduce a zombie process
(zombie_pid=$BASHPID; sleep 5; echo "Zombie process (PID: $zombie_pid) created") &
wait

echo "Parent process exiting"
