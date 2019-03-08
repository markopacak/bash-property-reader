#!/bin/bash

# Put the path to your properties file here
FILENAME="./application.properties"

# You can also pass the file name as argument to the bash script in the form:
# ./properties-reader-snippet.sh myfile.properties
# If a filename is provided as an argument, the script will try to open that one, otherwise it will
# fallback tot the one provided in the variable FILENAME

# Check if the argument was supplied
if [ $# -eq 0 ]
then
    FILE="$FILENAME"
else
    FILE="$1"
fi

# Check if it's a valid file
if ! [ -f "$FILE" ]
then
    echo "Could not find properties file: " $FILE " - Exiting script..."
    exit 1
fi

# Utility function that removes leading and trailing whitespaces from a string
trim(){
    [[ "$1" =~ [^[:space:]](.*[^[:space:]])? ]]
    echo "$1"
}

# Parse the properties file, ignoring:
#   - empty lines
#   - lines containing only spaces
#   - lines starting with a comment: # comment ...
while IFS="" read -r line || [[ -n "$line" ]]; 
do
    # ignore empty lines
    if [[ "$line" =~ [^[:space:]] ]];
    then
        # ignore comments
        if ! [[ "$line" = \#* ]];
        then
            # Here we have valid lines to be split into [key, value]
            IFS="=" read key value <<< "$line"
            key=$(trim "$key")
            value=$(trim "$value")

            echo "$key"
        fi
    fi

done < "$FILE"
