#!/bin/bash


suma=0

while read -r i;
do
letter=$(echo $i | cut -d' ' -f2 | tr -d ':' )
pass=$(echo $i  | cut -d' ' -f3 )

pos1=$(echo $i | cut -d'-' -f1 )
pos2=$(echo $i | cut -d'-' -f2 | cut -d' ' -f1)
let pos1--
let pos2--

if [[ $letter == ${pass:$pos1:1} ]] && ! [[ -z ${pass:$pos2:1} ]] && ! [[ $letter == ${pass:$pos2:1} ]]
then
	let suma++
elif ! [[ $letter == ${pass:$pos1:1} ]] && ! [[ -z ${pass:$pos2:1} ]] && [[ $letter == ${pass:$pos2:1} ]]
then
	let suma++
fi

done < input.txt

echo $suma
exit 0