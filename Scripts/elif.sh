#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
        echo "1 Active network interface found"
elif [ $value -gt 1 ]
then
        echo "Found multiple Network interface."
else
        echo "No active Network inteface."
