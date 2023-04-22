alias la="lsd -al"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias myip="curl checkip.amazonaws.com"
alias ipinfo="curl ip-api.com"
alias bat="batcat"
alias cat="bat $1 -p"

function transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    echo
}

alias transfer=transfer
