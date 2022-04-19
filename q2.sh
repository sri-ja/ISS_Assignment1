#/bin/bash
sed '/^$/d' -i quotes.txt
awk 'BEGIN{FS=" ~"} {print $2 " once said, \42" $1 "\42"}' quotes.txt > speech.txt

