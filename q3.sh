#!/bin/bash

wc -c $1 | awk '{print "File size (in bytes): " $1}'

wc -l $1 | awk '{print "Total number of lines: " $1}'

wc -w  $1 | awk '{print "Total number of words: " $1}'

linecount=1

while read line; do
	printf "Line No: $linecount - Count of Words: $(echo $line | wc -w) \n"
	((linecount++))
done < $1

awk '{ print tolower($0) }' $1 > temp.txt

grep -wo '[[:alnum:]]\+' temp.txt | sort | uniq -cd | awk '{print "Word: " $2 " - Count of repitition: " $1}'

rm temp.txt



