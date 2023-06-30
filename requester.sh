#!/bin/bash

count=0

while read line 
do
	
	sanitizedName=$(echo $line |  choose -f "https://" 1 | sed 's/\//@/g')


	curl -o "$sanitizedName" -Ls $line  &
	curl -o "$sanitizedName.header" -head -Ls $line  &
	
	count=$(($count+1))

	if [[ count == 20 ]]; then wait ; count=0; fi 

done

wait


