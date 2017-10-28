fpath=( "$HOME/.zfunc" $fpath )
path=( ${HOME}/bin /usr/local/bin /usr/local/sbin $path)
cdpath=(~ ~/git)

if [[ -f ~/.zsh/local ]]
then
    source ~/.zsh/local
fi

if [[ -x `which nvim` ]]; then
    EDITOR="nvim"
elif [[ -x `which vim` ]]; then
    EDITOR=vim
else
    EDITOR=vi
fi

export EDITOR

# disable flow control so we can use ctrl-s
[[ $- == *i* ]] && stty -ixon

ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

hs () { if [[ ! -z $1 ]];then history 0 | grep --color "$*";fi }


#source /home/jph/git/zsh-git-prompt/zshrc.sh
#PROMPT='%K{blue}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} $(git_super_status) %# %b%f%k'
##PROMPT='%B%m%~%b $(git_super_status) %# '
