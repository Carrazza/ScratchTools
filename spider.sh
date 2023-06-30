
subdomain_list=$1 
pasta=$2

cat $subdomain_list | httprobe | tee ${pasta}probed 

gospider -S ${pasta}probed --js -t 50 -d 3 --sitemap --robots -w -r | tee ${pasta}gospider.txt

cat ${pasta}gospider.txt | pcregrep -o "https?://.*" | unfurl -u domain | sort -u | tee ${pasta}sitesLinkados

