#!/bin/sh
filename="$1.cpp"
#Checks if there is one parameter passed in
if [ $# -ne 1 ]; then
    echo "One input only, the name of the source file (file.cpp) minus the extension" >&2
    exit 1
fi
#Checks if the file exits in the current directory and is a regular file
if [ ! -f $filename ]; then
    #prints an message to stderr
    echo "file doesn't exits, make sure there is no typo" >&2
    exit 1
else
    #Checks if there is an existing executable
    if [ -f $1 ]; then
        #if there is an existing executable, check if it is older by modification date. If the executable is older, then compile.
        if [ $1 -ot $filename ] ; then
            g++ -pedantic -Wall -Wextra -std=c++11 $filename -o $1
        else
            exit 0
        fi
      #if there is no existing executable, and the user has read permission on the source file, then compile
    elif [ -r $filename ]; then
        g++ -pedantic -Wall -Wextra -std=c++11 $filename -o $1
    else
        #prints message to stderr if the user do not have read permission on the source file
        echo "Do not have read permission, please chmod" >&2
    fi
fi
exit 0
