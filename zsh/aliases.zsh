
# aliases
alias d='dirs -v'
alias g='git'
alias h=history
alias k='kubectl'
alias vi=$EDITOR
alias vim=$EDITOR
alias yaml2js="python3 -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"
alias json2yaml="python3 -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)'"

# OS specific aliases and settings
case $OSTYPE in
    linux*)
        if [[ -f ~/.dircolors ]]; then
            eval "$(dircolors ~/.dircolors 2>/dev/null)"
        else
            eval "$(dircolors)"
        fi
        alias ls="ls --color=tty -N -F"
        # Add any other Linux-specific aliases here
        ;;
    darwin*)
        alias ls='ls -G'
        export LSCOLORS="gxfxcxdxbxegedabagacad"
        alias qt='top -ocpu -O+rsize -s 5 -n 20'
        alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
        alias sleepnow='pmset displaysleepnow'
        ;;
esac

# Override with lsd if available
if (( $+commands[lsd] )); then
    alias ls='lsd'
    alias tree='lsd --tree'
fi
