
# aliases
alias d='dirs -v'
alias g='git'
alias h=history
alias k='kubectl'
alias vi=$EDITOR
alias vim=$EDITOR
alias yaml2js="python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"

# OS specific aliases
case $OSTYPE {
    linux*)
        if [[ -f ~/.dircolors ]]; then
            eval `/usr/bin/dircolors ~/.dircolors 2> /dev/null`
        else
            eval `dircolors`
        fi
        alias ls="ls --color=tty -N -F"
    ;;
    darwin*)
        alias ls='ls -G'
        alias qt='top -ocpu -O+rsize -s 5 -n 20'
        alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
        alias sleepnow='pmset displaysleepnow'
# set colors for LS (man ls for color list)
        export LSCOLORS="gxfxcxdxbxegedabagacad"
    ;;
}

# work specific aliases
#if [[ -x $(which rkubectl) ]];then
#  alias kubectl=rkubectl
#fi
