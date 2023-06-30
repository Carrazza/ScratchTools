#!/bin/bash

lines=""

# Read all lines from stdin into the 'lines' variable
mapfile -t lines

echo $lines

for line in "${lines[@]}"; do
	domain=$(echo "$line" | cut -d "." -f 1)
	mkdir "$domain"
	cd "$domain" || return 1
	echo "$domain"
	lazy.sh "$line" "$domain"
	cd ..
done