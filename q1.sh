#!/bin/bash

#to remove empty lines
sed '/^$/d' -i quotes.txt

#to remove duplicates
awk '!seen[$0]++' quotes.txt > quotes_new.txt

mv quotes_new.txt quotes.txt







