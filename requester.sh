#!/bin/bash

while read line 
do
	
	sanitizedName=$(echo $line | unfurl paths | sed 's/\///')
	

	curl -Ls $line > "$sanitizedName"
	curl --head -Ls $line > "$sanitizedName.header" 

done

wait


