#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 3 ]; then
    echo "ERROR: Illegal number of parameters.
        Usage: convertUnit -unit1 -unit2 -value"
    exit 1
fi

unit1=$1
unit2=$2
value=$3
newValue=""


if [ $unit1 == "f" ]; then
    if [ $unit2 == "c" ]; then
        newValue=$(echo "($value - 32) * 5/9" | bc)
    fi
elif [ $unit1 == 'c' ]; then
    if [ $unit2 == 'f' ]; then
        newValue=$(echo "($value * 1.8) + 32" | bc)
    fi
else
    echo "Error: units $unit1 and $unit2 are not recognized!
    Recognized units are: 'f' (farenheight) and 'c' (celcius)"
    exit 1
fi

if [ $newValue != "" ]; then
    echo $newValue
fi
