#!/usr/local/bin/bash

length=$( head -n 1 input | wc -c )
let length--
index=0
trees=0
while read -r line; do

	if [[ $index -ge $length ]]; then
		let index=index-$length
	fi
	if [[ ${line:$index:1} == '#' ]]; then
		let trees++
	fi
	index=$(($index+3))
done < input 
echo "$trees"
