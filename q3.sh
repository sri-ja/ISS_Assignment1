#!/bin/bash

echo Part a
wc -c $1 | awk '{print "File size (in bytes): " $1}'

echo Part b
wc -l $1 | awk '{print "Total number of lines: " $1}'

echo Part c
wc -w  $1 | awk '{print "Total number of words: " $1}'

echo Part d
linecount=1

while read line; do
	printf "Line No: $linecount - Count of Words: $(echo $line | wc -w) \n"
	((linecount++))
done < $1

awk '{ print tolower($0) }' $1 > temp0.txt

cat temp0.txt | tr -d '[:punct:]' > temp1.txt

echo Part e
declare -a temparr
present=0

while read -ra line
do
	for word in "${line[@]}"
	do
		tempvar=$(grep -o -i $word temp0.txt | wc -l) 
		if [ $tempvar -gt 1 ]
		then
			present=0
			for i in "${temparr[@]}"
			do
				if [ "$word" == "$i" ]
				then
					present=1
				fi
			done
			if [ $present -eq 0 ]
			then
				temparr+=($word)
			fi
		fi
	done
done < temp1.txt

for word in "${temparr[@]}" 
do
	tempvar=$(grep -o -i $word temp0.txt | wc -l)
	echo "Word:" $word "- Count of repitition:" $tempvar
done

rm temp0.txt
rm temp1.txt




