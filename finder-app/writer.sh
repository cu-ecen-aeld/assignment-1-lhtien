#!/bin/bash

# Check for required arguments
if [ $# -ne 2 ]; then
  echo "Error: Please provide two arguments: file path and write string."
  exit 1
fi

# Define variables
writefile="$1"
writestr="$2"

# Create the directory structure if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the string to the file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ ! -f "$writefile" ]; then
  echo "Error: Could not create file '$writefile'."
  exit 1
fi

# Success message
echo "Successfully wrote '$writestr' to '$writefile'."

exit 0