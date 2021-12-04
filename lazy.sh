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
amass enum -noalts -passive -d $1 >>  ${passive} 
#-------------------------------------------------

#Active Recon -------------------------------------------
echo -e "$GREEN{-} Começando o scan ativo $ENDCOLOR"
    amass enum -noalts -active -brute -d $1 -w ~/wordlists/dns/subdomains.txt >>   ${passive}

wait


sort -u ${passive} > ${finalfile} 
cat ${finalfile}
rm ${passive}



