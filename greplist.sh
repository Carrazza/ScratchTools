#!/bin/bash
echo "Starting Anaylisis \n\n" >> analise_result.txt
echo "Procurando emails..."
echo -n "teste@teste.com" | grep -R -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
echo "Procurando CPF..."
echo -n "111.111.111-11" | grep -r -E -o '^([0-9]{3}\.){2}[0-9]{3}-[0-9]{2}$'
echo -n "11111111111" | grep -r -E -o '^[0-9]{11}$'
echo -n "111111111-11" | grep -r -E -o '^[0-9]{9}-[0-9]{2}$'
echo "Procurando CNPJ..."
echo -n "75.438.989/0001-19" | grep -r -E -o '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}$'
echo -n "75438989000119" | grep -r -E -o '^[0-9]{14}$'
echo -n "75438989/0001-19" | grep -r -E -o '^[0-9]{8}/[0-9]{4}-[0-9]{2}$'
echo -n "754389890001-19" | grep -r -E -o '^[0-9]{12}-[0-9]{2}$'
echo "Procurando MAC Address..."
echo -n "C8-1C-B4-88-DB-B9" | grep -r -E -o '^([a-fA-F0-9]{2}-){5}[a-fA-F0-9]{2}$'
echo -n "C8:1C:B4:88:DB:B9" | grep -r -E -o '^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$'
echo "Procurando http/https..."
echo -n "https://www.google.com.br/" | grep -r -E -o '^https?://([A-Za-z0-9_-]+[.]){1,3}[a-z]{2,3}/?[a-zA-Z0-9]*?$'
echo -n "https://www.google.com.br/teste/teste/" | grep -rEo '(http|https)://[^/"]+'
echo "Procurando CEP..."
echo -n "03070-001" | grep -r -E -o '^[0-9]{5}-[0-9]{3}$'
echo -n "--f03070-001r" | grep -r -Eo '[0-9]{5}-[0-9]{3}[^/"]+'
echo "Procurando unidades de medida..." 
echo -n "10KG" | grep -r -E -o '^[0-9]+[KMGTPEZYkmgtpezy]{1,2}$'
echo -n "3M" | grep -r -E -o '^[0-9]+[KMGTPEZYkmgtpezy]{1,2}$'
echo "Procurano hexadecimal..."
grep -r -E -o '^[0-9a-fA-F]{1,}$'
echo "Procurando ips..."
echo -n "191.34.74.130" | grep -r -E -o '^(([0-9]|[1-9][0-9]|1[0-9]{,2}|2[0-4][0-9]|25[0-5])[.]){3}([0-9]|[1-9][0-9]|1[0-9]{,2}|2[0-4][0-9]|25[0-5])$'
echo -n "17.45.191.255" | grep -R '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
echo "Procurando telefone móvel..."
echo -n "(11) 91010-1010" | grep -r -E -o '^\([0-9]{2}\)\s*[0-9]{5}-[0-9]{4}$'
echo -n "teste91010-1010teste" | grep -r -E -o '[^"]*[0-9]{5}-[0-9]{4}[^"]*'
echo -n "(11) 910101010" | grep -r -E -o '^\([0-9]{2}\)\s*[0-9]{9}$'
echo -n "(11)910101010" | grep -r -E -o '^\([0-9]{2}\)[0-9]{9}$'
echo -n "11 910101010" | grep -r -E -o '^[0-9]{2}\s*[0-9]{9}$'
echo -n "11910101010" | grep -r -E -o '^[0-9]{11}$'
echo -n "teste11910101010teste" | grep -r -E -o '[^"]*[0-9]{11}[^"]*'
echo "Procurando telefone residencial..."
echo -n "(11) 1010-1010" | grep -r -E -o '^\([0-9]{2}\)\s*[0-9]{4}-[0-9]{4}$'
echo -n "(11) 10101010" | grep -r -E -o '^\([0-9]{2}\)\s*[0-9]{8}$'
echo -n "11 50115010" | grep -r -E -o '^[0-9]{2}\s*[0-9]{8}$'
echo -n "1150115010" | grep -r -E -o '^[0-9]{10}$'
echo "Procurando moeda real..."
echo -n "100,00" | grep -r -E -o '^[0-9]{1,3}\b(\.[0-9]{3})*,[0-9]{2}$'
echo -n "3.100,00" | grep -r -E -o '^[0-9]{1,3}\b(\.[0-9]{3})*,[0-9]{2}$'
# Buscas úteis
find ./ -name "*.bks"
find ./ -name "*.json"
find ./ -name "*.xml"
find ./ -name "*.js"
find ./ -name "*.crt"
find ./ -name "*.cer"
find ./ -name "*.smali" android
find ./ -name "*.java" android
find ./ -name "*.cs" 
find ./ -name "*.jar" android
find ./ -name "*.plist" iphone
find ./ -name "*.js" -exec js-beautify {} \;
find ./ -name "*.json" -exec jsonpp {} \;
# Palavras chaves para buscar em arquivos: TOKEN, ZENDESK, API, TOKENIZER, URL, URL_POST, URL_GET, API_KEY, KEY, tickets.json, user-token, 
echo "Procurando por strings"
grep -RahoEi '"([^"]*)"' .  | sort | uniq >> analise_strings.txt
grep -RahoEi '"([^"]*)"' .  | sort -u >> analise_strings.txt
Example replace words
echo -n 'br/com/portoseguro/azulseguros/Auto_Apolice.java' | sed 's/\//\_/g' | sed 's/\./\_/g'
echo -n '' | sed 's/\//\_/g' | sed 's/\./\_/g'
