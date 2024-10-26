#!/bin/bash

if [ $# != 2 ]; then
    echo "Error: $0 <files direction> <search string>"
    echo "For example: $0 /tmp/aeld-data AELD_IS_FUN"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: '$1' is not a directory."
    exit 1
fi

filesdir="$1"
searchstr="$2"

file_count=0
match_count=0

# List all the files in this dir and subdirectory
FILES=$(find $filesdir -type f)
for FILE in $FILES; do

    file_count=$((file_count + 1))
    grep -r "$searchstr" "$FILE"
    if [[ $? -eq 0 ]]; then
        match_count=$((match_count + 1))
    fi

done

echo "The number of files are $file_count and the number of matching lines are $match_count"
exit 0
