
# aliases
alias d='dirs -v'
alias g='git'
alias h=history
alias k='kubectl'
alias vi=$EDITOR
alias vim=$EDITOR
alias yaml2js="python3 -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"
alias json2yaml="python3 -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)'"

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
#

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/kubectl.plugin.zsh
# kubectl
alias kcn='kubectl config set-context --current --namespace'
