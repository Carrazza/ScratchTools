#this is a simple  scan tool I've been trying to make to get information faster from the https://crt.sh/ . I know it's not complete and I think i could make it smaller but i wanted to share anyway.
#To use it just type ./crt.sh insertDomain.com


 
#The %25 is the url equivalent to % which is a wildcard in crt.sh, so, it will not only search www domains (in this case), i remember trying to put the wildcard in other places too but I don't think that returned anything new, well I will test it nonetheless aftwards
#crt.sh will organize the information in json if you send the query parameter output=json , that's pretty neat. Thanks to nahamsec for showing this one in one of his talks.
crtQuery="https://crt.sh/?q=%25."$1"&output=json"

crtJson=$(curl -s $crtQuery | jq -r '.[].name_value');

echo $crtJson