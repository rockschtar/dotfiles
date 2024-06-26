# List all files with detailed information
alias la="lsd -al"

# Access dotfiles using Git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Get information about public IP
alias ipinfo="curl ip-api.com"

# Display files with syntax highlighting
alias cat="bat -p"

# Open Firefox Developer Edition
alias firefox='open -a "Firefox Developer Edition"'

# Transfer files via curl
function transfer() {
    # Transfer file via 0x0.st service
    curl -F file=@"$1" https://0x0.st | tee /dev/null
    echo
}

# Get weather information based on current IP location
function wttr() {
    # Retrieve city information
    location=$(curl ip-api.com/json --silent | jq -r '.city')
    # Display weather information
    curl "v2d.wttr.in/$location"
}

# Get public IP details
function myip() {
    # Retrieve IP details and concatenate into a single line
    echo $(curl ip-api.com/json --silent | jq -r '"\(.query) | \(.city) | \(.zip) | \(.isp)"')
}

# Source local aliases if present
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi