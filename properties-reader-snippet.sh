#!/bin/bash

# Put the path to your properties file here
FILE="./application.properties"

# You can also pass the file name as argument to the bash script in the form:
# ./properties-reader-snippet.sh myfile.properties
FILE_ARG=$1

if ! [ -f "$FILE" ]
then
    echo "Could not find properties file: " $FILE " - Exiting script..."
    exit 1
fi

