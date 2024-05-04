#!/bin/bash
LOGO_COLOR="green"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    if [ -f /etc/os-release ]; then
        source /etc/os-release
        if [[ "$ID" == "ubuntu" ]]; then
            LOGO_COLOR="red"
        elif [[ "$ID" == "debian" ]]; then
            LOGO_COLOR="red"    
        elif [[ "$ID" == "fedora" ]]; then
            LOGO_COLOR="blue"
        elif [[ "$ID" == "arch" ]]; then
            LOGO_COLOR="cyan"
        elif [[ "$ID" == "pop" ]]; then
            LOGO_COLOR="cyan"        
        fi    
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    LOGO_COLOR="yellow"
fi

#fastfetch --load-config $HOME/.config/fastfetch/config.jsonc --logo $HOME/.config/fastfetch/cyberdyne.ascii --logo-type file --logo-color-1 $LOGO_COLOR
fastfetch --logo-color-1 $LOGO_COLOR
