#!/bin/bash

until kubectl config view &> /dev/null
do
    echo "Waiting for kubectl host ..."
    sleep 1
done

echo -e "\nThe kubectl host is running."