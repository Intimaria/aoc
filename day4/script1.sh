#!/usr/local/bin/bash

#add blank line to end of file 
echo $'\n\n' >> input

arr=()
count=0
while read -r  line 
do 
 
    if ! [[ -z $line ]] ; then
		echo $line | tr ' ' '-' | tr '\n'  &> /dev/null
        arr+=$line
    else
        found=$( awk '(/byr/ && /iyr/ && /eyr/ && /hgt/ && /hcl/ && /ecl/ && /pid/)' <<< "${arr[@]}" )
        if ! [[ -z $found ]] ; then 
			let count++
		fi
		arr=()
	fi 
done < input
echo $count
