#!/bin/bash

count=0

while [ $count -lt 3 ]
do
        echo "Looping...."
        echo "Value of count is $count"
        count=$(( $count + 1 ))
done
echo "Out of the loop"