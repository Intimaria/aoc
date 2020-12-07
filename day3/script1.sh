#!/usr/local/bin/bash

index=0
trees=0
while read -r line; do
length=$( echo ${line[*]} | wc -c )
let length--
	if [[ $index -ge $length ]]; then
		let index=index-$length
	fi
	if [[ ${line:$index:1} == '#' ]]; then
		let trees++
	fi
	index=$(($index+3))
done < input3.txt 
echo "$trees"
