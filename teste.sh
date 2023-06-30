#!/bin/bash

threads=0;

for i in $(seq 10)
do
	threads=$(( $threads+1 ))

	sleep 10 & 

	if [[ $threads -eq 4 ]]; then echo Thread4 ; wait; threads=0; fi;


done
