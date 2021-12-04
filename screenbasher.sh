#!/bin/bash


#utilização! 
# cat dominios | ./screenbasher.sh nomeDaPastaDeScreenshot




#
#{
    ######## CRIAÇÃO DA PASTA PARA GUARDAR OS SCREENSHOTS #############


    #nome passado pelo comando
    nome=$1

    #no if, o -z checa se a variável é nula/vazia que nesse caso seria se o moço esqueceu de dar um nome pra pasta de screenshot
    if [[ -z $nome ]]; then

        echo "Forneça o nome da pasta de screenshots por favor"
        exit

    fi

    #Cria pastinhas
    mkdir -p $nome

    #É importante entrar na pastinha pq se n o programa não salva as coisas dentro dela
    cd ./$nome

#}


#{
    ####################### LEITURA E SCREENSHOT DOS DOMÍNIOS ##############################

    #A primeira coisa que fazemos é ler do stdin os dominios que foram passado pelo cat. Fazemos isso com o read, nesse caso ele vai ler uma linha, fazer as operações e continuar enquanto tiver coisa pra ler 

    #Porra do read as vezes n lê a última linha pq ela n tem \n. Checo se tiver lido qualquer coisa no domain com o OR [ -n $domain ]  (o -n checa se a string é não nula no caso)
    while read domain || [ -n "$domain" ]; do 

        #n pode ponto em nome de arquivo nem /, tr vai tirar todos os pontos e / que ele achar numa string
        name=$(echo $domain | tr -d "./")

        name="$name.png"

        #if cat $domain | grep -q 

        #saber qual dominio tamo fazendo 
        echo $domain

        #magic happens here 
        chromium --headless --disable-gpu --screenshot="$name" "https://"$domain 2> /dev/null 
    

    done 


    #Esse wait serve para sincronizar as ""threads"" que criamos com o & , ele impede que o programa siga em frente até que elas terminem.
    #Eu coloquei isso aqui pq se o programa chegar ao fim antes de um dos screenshots terminar, ele deve fechar tudo e teremos problema (n cheguei a testar nada though, é uma hipótese)
    wait

#}


#se vc quiser fazer um pequeno experimento para checar a diferença da utilização de threads faça um outro programa tirando o & do comando do chromium e faça
#
# time cat dominios | ./screenbasher.sh nomeDaPastaDeScreenshot
# time cat dominios | ./screenbasherSemThreads.sh nomeDaPastaDeScreenshot
#
# e veja a diferença!


#Com essa mesma estrutura, é possível usar muitos outros comandos e ideias, trocando o comando do chromium podemos colocar um curl para pegar o código fonte de todos os dominios, usar uma lista de bruteforce, e muitas outras coisas. 

#Tentem também automatizar aquele processo que mostrei pra vcs do sort e façam um sh que procura direto no crt.sh, sublister, assetfinder e já compile tudo em um arquivo só!

