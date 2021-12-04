#!/bin/bash


list=$(gf -list)
file="../$1"

for pattern in $list; do

    echo "$pattern----------------------------------------------------------------" >> $file
    
    gf $pattern | tee -a $file


done
    subl $file