
#mudar
pasta="./"

passive=$1
#finalfile=$2
domain=$2



#Passive Recon ----------------------------------


#assetfind
#echo -e "$GREEN{-} Checando o Assetfinder $ENDCOLOR"
assetfinder $domain >>  ${passive} 

#crt.sh
##echo -e "$GREEN{-} Checando o crt.sh $ENDCOLOR"
crtQuery="https://crt.sh/?q=%25."$domain"&output=json"

curl -s $crtQuery | jq -r '.[].name_value' | anew   ${passive} 

#subfinder
#echo -e "$GREEN{-} Checando o subfinder $ENDCOLOR"
subfinder -silent -d $domain | anew  ${passive} 

#amass
#echo -e "$GREEN{-} Checando o amass $ENDCOLOR"
amass enum -noalts -passive -d $domain -rf /home/carrazza/resolvers.txt | anew ${passive} 
#-------------------------------------------------

echo "done $domain"