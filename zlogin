# needed for gpg agent
GPG_TTY=$(tty)
export GPG_TTY
export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
# run keychain
if [[ -f ~/.keychain/$(hostname)-sh ]]; then
   source ~/.keychain/$(hostname)-sh
fi

if [[ -x $(which keychain) ]];then
    eval $(keychain -q --lockwait 60 --agents gpg,ssh --eval jph_digitalocean id_ed25519 F2D12948 )
fi

#export SSH_AUTH_SOCK
#export SSH_AGENT_PID
