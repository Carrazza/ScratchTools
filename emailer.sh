domain=$1
while read name || [ -n "$name" ]; do 


	#Em ordem
	# tr passa tudo pra donwcase
	# awk pega o primeiro e segundo nome
	# grep confirma só os emails
	# grep 2 tira as paradas que o theHarvester faz de besteirol no output

	cat $name |tr '[:upper:]' '[:lower:]'| awk -v domain=$domain '{print $1"."$2"@"domain}' | grep -EiEio '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b' | egrep -vi "searching|theharvester" | sort -u  
	

done;