# run keychain
if [[ -f ~/.keychain/$(hostname)-sh ]]; then
   source ~/.keychain/$(hostname)-sh
fi

if [[ -x $(which keychain) ]];then
    eval $(keychain -q --lockwait 60 --eval id_rsa jah_id_ecdsa augur_id_rsa jph_digitalocean)
fi

#export SSH_AUTH_SOCK
#export SSH_AGENT_PID
