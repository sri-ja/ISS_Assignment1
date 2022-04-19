#!/bin/bash

read -p "Please enter the list of numbers to be sorted (comma separated) " input
IFS=',' read -ra arr <<< "$input"

length=${#arr[@]}

for (( i = 0; i < length ; i++))
do
	for ((j = 0; j < length-i-1; j++))
	do
		if [ ${arr[j]} -gt ${arr[$((j+1))]} ]
		then
			temp=${arr[j]}
			arr[$j]=${arr[$((j+1))]}
			arr[$((j+1))]=$temp
		fi
	done
done

echo ${arr[*]}
