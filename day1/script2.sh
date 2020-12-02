#!/bin/bash

mult=0

main(){
value=2020
rev=($(cat input.txt | sort -rn ))
length=${#rev[@]}
for i in {0..198}
do
	stay=$i
	left=$(($i+1))
	right=$(($length-1))
	while [ $left -lt $right ]
	do
		one=${rev[$left]}
		two=${rev[$right]}
		three=${rev[$stay]}
		sum=$((one+two+three))
		if [ $sum -eq $value ]
		then 
			mult=$((one*two*three))
			echo $mult
			return 0
		elif [ $sum -gt $value ]
		then
			let left++
		else 
			let right--
		fi	
	done
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
