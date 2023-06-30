
#Caralho bosta merda, digitei errado
alias ks="ls"
alias kl="ls"
alias cl="clear"
alias cle="clear"
alias clea="clear"
#-----------------------------------


alias cel="echo 55331212177"
#Github preguiça

alias gis="git status"

alias pgrep="pcregrep"

#Nix
alias lx="lnix"

#Dorks
alias dorks="firefox https://hackoonspace.notion.site/Google-Hacking-27f1dcd619c146faa0c97f43c9dd6781"

#Editar arquivos de configuração

alias vrc="vim ~/.vimrc"
alias arc="vim ~/.bash_aliases"
alias zrc="vim ~/.zshrc"
alias vim_path="cd /home/carrazza/.local/share"
alias vim="nvim"


#------------------------------

#Comandos terminal

alias histg="history | grep"
alias al="cat ~/.bash_aliases"
#---------------------------
alias sourceAlias="source ~/.bash_aliases"
alias ghidra="~/Tools/ghidra/ghidraRun"
alias c="clear"
alias ..="cd .."
#Xampp bosta

alias xampp="sudo /opt/lampp/lampp"
alias xampp_man="sudo /opt/lampp/manager-linux-x64.run"
alias xampp_files="/opt/lampp/htdocs"

#--------------------------------

#Box e hack stuff
alias thm="cd ~/tryHackMe"
alias thmVpn="sudo openvpn ~/tryHackMe/boopest.ovpn"
alias box="cd ~/hackTheBox"
alias boxVpn="sudo openvpn ~/hackTheBox/Boopest.ovpn"
#--------------------------------------------

#docker 

alias sdocker="sudo systemctl enable docker --now"


#Pastas
alias tls="cd ~/Tools"
alias tsc="cd ~/Tools/ScratchTools"



#Funçoes 

alias copy="xclip -sel clip"
alias paste="xclip -o -sel clip"
alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"

alias ok="ping google.com -c 4"
alias massdns="/home/carrazza/Tools/massdns/bin/massdns"
alias mobsf=""
alias charles="export _JAVA_OPTIONS=""; export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dawt.useSystemAAFontSettings=lcd -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.uiScale=125%';source . ;/home/carrazza/Desktop/charles/bin/charles"

#---TaskWarrior

source ~/.task_aliases.sh

alias kb="cat ~/task_tui.config"
alias thome="~/tHome"
alias twork="~/tWork"

export wpTok="6a6CeuLa7cNU0w0O4fAvQPemyGzZJrxVj84lyRfxZt4"
#


alias tomcat="sudo /opt/tomcat/apache-tomcat-10.0.27/bin/startup.sh ; firefox http://127.0.0.1:9090"

ckdir () {
    mkdir -p $1
    cd $1
}

job () {
    
    cd ~/RTA/$1
}



todo () {
    
    echo "- [ ] $1" >> ./todo.md

}

lazy () {

    lazy.sh $1 ; spider.sh $1.txt

}

lazyAll() {

	while read line || [ -n "$line" ]; 
	do
		domain=$(echo $line | choose -f "\." 0)
		mkdir $domain
		cd $domain
		echo $domain

		lazy.sh $line $domain
		cd ..

	done

}

teste() {

	while read line ; 
	do

		mkdir $line
		cd $line
		cpf > cpf
		cd ..

	done

}

getOffice365 () {
	
	curl -s "https://login.microsoftonline.com/$1/v2.0/.well-known/openid-configuration" | jq

	curl -s "https://login.microsoftonline.com/getuserrealm.srf?login=usuario@$1&xml=1" | xmllint --format -
}

fixSpider() {

	echo "[ $(cat $1 | sed "s/\}/\}\,/g"){}]"
}

alias beauty="xargs js-beautify -r"

alias urlGrep="pcregrep -o 'https?://.*'" 


