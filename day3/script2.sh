#!/usr/local/bin/bash

index=0
trees=0

length=31
find() {
while read -r line  && [[ $2 -lt $length ]]; do
		if [[ $index -ge $length ]]; then
			let index=index-$length
		fi
		if [[ ${line:$index:1} == '#' ]]; then	
			let trees++
		fi
	index=$(($index+$1))
	
done < input3.txt 
echo "$trees" 
}

find_two() {
file=$( cat input3.txt | sed -n 'p;n' );
for line in ${file[@]}; do

		if [[ $index -ge $length ]]; then
			let index=index-$length
		fi
		if [[ ${line:$index:1} == '#' ]]; then	
			let trees++
		fi
	index=$(($index+$1))
	
done < input3.txt 
echo "$trees" 
}
trees7=$(find 7 1)
echo "$trees7"

trees5=$(find 5 1)
echo "$trees5"

trees3=$(find 3 1)
echo "$trees3"

trees1=$(find 1 1)
echo "$trees1"

trees2=$(find_two 1 2)
echo "$trees2"

echo $(($trees1*$trees3*$trees5*$trees7*$trees2))