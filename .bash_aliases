alias la="lsd -al"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias myip="curl checkip.amazonaws.com"
alias ipinfo="curl ip-api.com"
alias cat="bat $1 -p"

function transfer() {
	curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null
	echo
}

alias transfer=transfer
alias firefox='open -a "Firefox Developer Edition"'

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi

function wttr() { 
	location=$(curl ip-api.com/json --silent | jq .city)
	curl "v2d.wttr.in/$location"
}
