#!/bin/bash


while read domain || [ -n "$domain" ]; do 
    
    if nslookup $domain > /dev/null ; then 
    
        echo $domain
    fi    

done 