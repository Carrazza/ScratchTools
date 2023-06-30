#!/bin/bash

#--------------Corzinhas
GREEN="\e[32m"
YELLOW='\033[1;33m'
ENDCOLOR="\e[0m"
##############################################


#mudar
pasta="./"

passive=${pasta}$1.passive.txt
finalfile=${pasta}$1.txt



function passiveRecon() {


#Passive Recon ----------------------------------

	#sublister
	echo -e "$GREEN{-} Checando o Sublist3r $ENDCOLOR"
	sublist3r -d $1 -o ${passive} > /dev/null 

	#assetfinder
	echo -e "$GREEN{-} Checando o Assetfinder $ENDCOLOR"
	assetfinder $1 >>  ${passive} 

	#crt.sh
	echo -e "$GREEN{-} Checando o crt.sh $ENDCOLOR"
	crtQuery="https://crt.sh/?q=%25."$1"&output=json"

	curl -s $crtQuery | jq -r '.[].name_value' >>   ${passive} 

	#subfinder
	echo -e "$GREEN{-} Checando o subfinder $ENDCOLOR"
	subfinder -silent -d $1 >>   ${passive} 

	#amass
	echo -e "$GREEN{-} Checando o amass $ENDCOLOR"
	amass enum -noalts -passive -d $1 -rf /home/carrazza/resolvers.txt >>  ${passive} 
	#-------------------------------------------------


}

function secTrail(){

	echo -e "$GREEN{-} secTrails.sh $ENDCOLOR"

	/home/carrazza/Tools/ScratchTools/secTrails.sh $1 | tee secTrails

	cat secTrails >> ${passive} 
}

function recur(){

	recDomains=$(cat ${passive} | sort -u)

	echo "Domains $(echo $recDomains | wc -l )"

	threads=0;
	for i in ${recDomains};
	do
	
	    threads=$(( $threads+1 ))
	
	    /home/carrazza/Tools/ScratchTools/recurlazy.sh $passive $i &
	
	    if [[ $threads -eq 15 ]]; then echo Thread4 ; wait; threads=0; fi;
	
	done
	
}

function active(){
	#Active Recon ----------------------------------------
	if [ -z $2 ]
	then
		echo -e "$GREEN{-} Começando o scan ativo $ENDCOLOR"
	#       amass enum -noalts -active -brute -d $1 -w ~/wordlists/dns/smallDns.txt -rf /home/carrazza/resolvers.txt >>   ${passive}

	fi

	wait
}

function extras(){

	echo -e "$GREEN{-} Checando o gauplus $ENDCOLOR"
	cat ${finalfile} | xargs -I {} bash -c "gauplus -t 10 -random-agent | unfurl -u domain | anew gauplus" 



	echo -e "$GREEN{-} Checando o waybackUrls $ENDCOLOR"
	cat ${finalfile} | xargs -I {} bash -c "waybackurls {} | unfurl -u domain | anew wayback"
}

function ajeita(){
	sort -u ${passive} >> ${finalfile} 
	rm ${passive}
}

passiveRecon
secTrail
recur
ajeita

#cat wayback gauplus | sort -u | anew ${finalfile}

 
/home/carrazza/Tools/ScratchTools/spider.sh $finalfile


cat sitesLinkados | grep $(echo $1 | sed "s/\./ /" | choose 0) | anew ${finalfile}


DnsFile="AllUpDNS-$1"


puredns resolve ${finalfile} --resolvers ~/resolvers.txt | tee $DnsFile

wc -l $DnsFile ; wc -l $finalfile ; wc -l secTrails ;

