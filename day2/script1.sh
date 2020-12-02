#!/usr/local/bin/bash


suma=0

while read i;
do
letter=$(echo $i | cut -d' ' -f2 | tr -d ':' )
pass=$(echo $i  | cut -d' ' -f3 )

min=$(echo $i | cut -d'-' -f1 )
max=$(echo $i | cut -d'-' -f2 | cut -d' ' -f1)
num=$( tr -dc "$letter" <<< "$pass" | tr -d ' ' | wc -c )
if [[ $num -ge $min ]] && [[ $num -le $max ]]; then
	let suma++
fi


done < input

if [[ $suma -ne 0 ]]; then
echo $suma
fi 
exit 0
