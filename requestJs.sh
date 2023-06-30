#!/bin/bash
while read line ; do  curl -s $line | js-beautify | tee $(echo $line | choose -f / 1 -1 | sed "s/ /-/" )  ; done

