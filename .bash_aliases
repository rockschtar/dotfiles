alias la="lsd -al"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias myip="curl checkip.amazonaws.com"
alias ipinfo="curl ip-api.com"
alias cat="bat $1 -p"
alias firefox='open -a "Firefox Developer Edition"'

function transfer() {	
	#curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null
	curl -F file=@$1 https://0x0.st | tee /dev/null
	echo
}

function wttr() { 
	location=$(curl ip-api.com/json --silent | jq .city)
	curl "v2d.wttr.in/$location"
}

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi