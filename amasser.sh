parts=$(ls ~/wordlists/dns/parts2/)


for i in $parts;
do
    echo "$1"
    puredns bruteforce ~/wordlists/dns/parts2/$i $1 -r ~/resolvers.txt -l 5000 -w $i  
    
done
