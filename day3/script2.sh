#!/usr/local/bin/bash

length=$( head -n 1 input | wc -c )
let length--
index=0
trees=0

find() {
# second condition in while makes process faster dunno why
while read -r line  && [[ $2 -lt $length ]]; do
		if [[ $index -ge $length ]]; then
			let "index=index-$length"
		fi
		if [[ ${line:$index:1} == '#' ]]; then	
			let trees++
		fi
	index=$(($index+$1))	
done < input
echo "$trees" 
}

find_two() {
# delete every two lines keep even lines in array
file=$( cat input3.txt | sed -n 'p;n' );
for line in ${file[@]}; do
		if [[ $index -ge $length ]]; then
			let "index=index-$length"
		fi
		if [[ ${line:$index:1} == '#' ]]; then	
			let trees++
		fi
	index=$(($index+$1))
done < input
echo "$trees" 
}

trees1=$(find 1 1)
trees2=$(find_two 1 2)
trees3=$(find 3 1)
trees5=$(find 5 1)
trees7=$(find 7 1)
echo $(($trees1*$trees2*$trees3*$trees5*$trees7))