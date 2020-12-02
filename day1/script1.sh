#!/usr/local/bin/bash

mult=0

main(){
	
rev=($(cat input.txt | sort -nr ))
num=${#rev[@]} 
let num--
index=0
comp=2020

while [ $num -gt $index ]
do
	one=${rev[$num]}
	two=${rev[$index]}
	sum=$((one+two))
	if [ $sum -eq $comp ]
	then 
		mult=$((one*two))
		echo $mult
		return 0
	elif [ $sum -gt $comp ]
	then
		let index++
	else 
		let num--
	fi	
done
}

mult=$(main) 

if [[ $mult -ne 0 ]]
then
	echo $mult
else
	echo "The numbers were not found"
	exit 1
fi 

exit 0
