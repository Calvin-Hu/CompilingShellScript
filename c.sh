#!/bin/sh
filename="$1.cpp"
if [ ! -f $filename ]; then
    echo "file doesn't exits, make sure there is no typo" >&2
    exit 1
else
    if [ -f $1 ]; then
        if [ $1 -ot $filename ] ; then
            g++ -pedantic -Wall -Wextra -std=c++11 $filename -o $1
        else
            exit 0
        fi
    elif [ -r $filename ]; then
        g++ -pedantic -Wall -Wextra -std=c++11 $filename -o $1
    else
        echo "Do not have read permission, please chmod" >&2
    fi
fi
exit 0