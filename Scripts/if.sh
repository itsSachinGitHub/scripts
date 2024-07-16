#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -gt 100 ]
then
        echo "We have entered into the If condition"
        sleep 3
        echo "Your number is greater than 100."
        echo
        date
else
        echo "Your number is less then 100."
fi

echo "Execution completed."
