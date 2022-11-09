cat $1 | httpx -random-agent -retries 2 -no-color -o probed

gospider -S probed --js -t 50 -d 3 --sitemap --robots -w -r | tee gospider.txt

cat gospider.txt | pcregrep -o "https?://.*" | unfurl -u domain | sort -u | tee sitesLinkados
