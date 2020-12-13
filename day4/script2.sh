#!/usr/local/bin/bash

# new_input.txt contains the valid passports only (processed in part 1)

# outsource function to validate height
height () {
if [[ $1 =~ ^[0-9]{3}cm$ ]] && (( 150 <= ${1%cm} <= 193 ))
  then
    return 0
  elif [[ $1 =~ ^[0-9]{2}in$ ]] && (( 59 <= ${1%in} <= 76 ))
  then
    return 0
  else
    return 1
  fi
}

count=0
while read -r line 
do

# organize the passport data 

declare -A associative
	for i in $line
	do
		associative[$(echo $i | cut -d":" -f1)]=$(echo $i | cut -d":" -f2)
	done
unset associative[cid]
arr=($(echo ${associative[@]} | cut -d" " -f1-7))

# validate the passport data 

iy=0;b=0;e=0;ey=0;he=0;ha=0;id=0

	for i in ${!arr[@]}
	do
		case $i in 
			0) [[ ${arr[$i]} =~ ^2[0-9]{3}$ ]] && ((  2010 <= ${arr[$i]} )) && (( ${arr[$i]} <= 2020 )) && iy=1 || continue ;;
			1) [[ ${arr[$i]} =~ ^2[0-9]{3}$ ]] && ((  2020 <= ${arr[$i]} )) && (( ${arr[$i]} <= 2030 )) && e=1 || continue ;;
			2) height ${arr[$i]} && he=1 || continue ;;
			3) [[ ${arr[$i]} =~ ^[0-9]{9}$ ]] && id=1 || continue ;;
			4) [[ ${arr[$i]} =~ ^[0-9]{4}$ ]] && ((  1920 <= ${arr[$i]} )) && (( ${arr[$i]} <= 2002 )) && b=1 || continue ;;
			5) [[ ${arr[$i]} =~ ^#[a-f|0-9]{6}$ ]] && ha=1 || continue ;;
			6)  eyes=$(awk (/amb/ || /blu/ || /brn/ || /gry/ || /grn/ || /hzl/ || /oth/ ) <<<  "${associative[ecl]}" ) # awk '()'
                [[ ! -z $eyes ]] && ey=1  || continue;;
		esac

	[[ iy -eq 1 ]] && [[ e -eq 1 ]] && [[ b -eq 1 ]] && [[ he -eq 1 ]] && [[ ey -eq 1 ]] && [[ ha -eq 1 ]] && [[ id -eq 1 ]] && count=$((count+1)) 
	done
done < new_input.txt

echo $count