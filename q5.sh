#!/bin/bash

read -p "Please enter string: " string 
revstr=`echo $string | rev`

echo Part a:
echo $revstr

strlen=${#revstr}

fancy=$(echo "$revstr" | tr "a-zA-Z" "b-zaB-ZA")
echo Part b:
echo $fancy

numgo=$(( $strlen/2 ))
firstpart=${string:0:$numgo}
firstpart=`echo $firstpart | rev`
newstr=${firstpart}${string:$numgo:$numgo}
echo Part c:
echo $newstr
