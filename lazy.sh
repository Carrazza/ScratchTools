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
amass enum -noalts -passive -d $1 -rf /home/carrazza/resolvers.txt >>  ${passive} 
#-------------------------------------------------

#Active Recon ----------------------------------------
if [ -z $2 ]
then
    echo -e "$GREEN{-} Começando o scan ativo $ENDCOLOR"
        amass enum -noalts -active -brute -d $1 -w ~/wordlists/dns/smallDns.txt -rf /home/carrazza/resolvers.txt >>   ${passive}

fi

wait


sort -u ${passive} > ${finalfile} 
rm ${passive}


echo -e "$GREEN{-} Checando o gauplus $ENDCOLOR"
cat ${finalfile} | xargs -I {} bash -c "gauplus -t 10 -random-agent | unfurl -u domain | anew gauplus" 



echo -e "$GREEN{-} Checando o waybackUrls $ENDCOLOR"
cat ${finalfile} | xargs -I {} bash -c "waybackurls {} | unfurl -u domain | anew wayback"


cat wayback gauplus | sort -u | anew ${finalfile}

 

