#!/bin/bash
LOGO_COLOR=""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    if [ -f /etc/os-release ]; then
        source /etc/os-release
        if [[ "$ID" == "ubuntu" ]]; then
            LOGO_COLOR="red"
        elif [[ "$ID" == "fedora" ]]; then
            LOGO_COLOR="blue"
        fi    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    LOGO_COLOR="green"
fi

fastfetch --load-config $HOME/.config/fastfetch/config.jsonc --logo $HOME/.config/fastfetch/cyberdyne.ascii --logo-type file --logo-color-1 $LOGO_COLOR