BATCMD="bat"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    if [ -f /etc/os-release ]; then
        source /etc/os-release
        if [[ "$ID" == "ubuntu" ]]; then
            BATCMD="batcat"
        elif [[ "$ID" == "debian" ]]; then
            BATCMD="batcat"
        fi    
    fi
fi

if [[ "$OSTYPE" == "linux-gnu"*  && "$(uname -m)" != "aarch64" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ "$OSTYPE" == "linux-gnu"*  && "$(uname -m)" == "aarch64" ]]; then
	if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  		PATH="${PATH:+${PATH}:}/$HOME/.fzf/bin"
	fi
fi

export FZF_DEFAULT_OPTS="--preview \"$BATCMD -n --color=always --line-range :500 {}\""

eval "$(fzf --zsh)"