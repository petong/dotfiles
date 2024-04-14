# !# needed for gpg agent
#GPG_TTY=$(tty)
#export GPG_TTY
#export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
## run keychain
#if [[ -f ~/.keychain/$(hostname)-sh ]]; then
#   source ~/.keychain/$(hostname)-sh
#fi
#
#if [[ -x $(which keychain) ]];then
#    eval $(keychain -q --lockwait 60 --agents ssh --eval id_ed25519_ripple )
#fi
#
##export SSH_AUTH_SOCK
##export SSH_AGENT_PID
