#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Check for specific Linux distributions
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        if [[ "$ID" == "ubuntu" ]]; then
            # Set logo color for Ubuntu (Light Magenta)
            LOGO_COLOR="red"
        elif [[ "$ID" == "fedora" ]]; then
            # Set logo color for Fedora (Light Yellow)
            LOGO_COLOR="blue"
        else
            # Set default logo color for other Linux distributions (Light Cyan)
            LOGO_COLOR=""
        fi
    else
        # Set default logo color for unrecognized Linux distributions (Light Cyan)
        LOGO_COLOR=""
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Set logo color for macOS (Light Green)
    LOGO_COLOR="green"
else
    # Set default logo color for other operating systems (No color)
    LOGO_COLOR=""
fi

fastfetch --load-config $HOME/.config/fastfetch/config.jsonc --logo $HOME/.config/fastfetch/cyberdyne.ascii --logo-type file --logo-color-1 $LOGO_COLOR