#
# brew-command-not-found script for OS X
#
# Usage: Source it somewhere in your .bashrc
#
# Author: Baptiste Fontaine
# URL: https://github.com/bfontaine/homebrew-command-not-found
# License: MIT
# Version: 0.2.0
# 

[ ! -z "$(which brew)" ] && command_not_found_handle() {

    local cmd="$1"

    # <from Linux Journal>
    #   http://www.linuxjournal.com/content/bash-command-not-found

    export TEXTDOMAIN=command-not-found

    # do not run when inside Midnight Commander or within a Pipe
    if test -n "$MC_SID" -o ! -t 1 ; then
        echo $"$cmd: command not found"
        return 127
    fi

    # </from Linux Journal>

    local f=$(brew which-formula $cmd 2>/dev/null | head -n 1)

    if [ -z "$f" ]; then
        echo $"$1: command not found"
        return 127
    fi

    echo $"The program '$cmd' is currently not installed. You can install it by typing:"
    echo $"  brew install $f"

}