
# check for gpg-agent info
# if [ -f "${HOME}/.gpg-agent-info" ]; then
#   source  "${HOME}/.gpg-agent-info"
#   export GPG_AGENT_INFO
#   export SSH_AUTH_SOCK
#   export SSH_AGENT_PID
# fi

# run keychain
if [[ -f ~/.keychain/$(hostname)-sh ]]; then
   source ~/.keychain/$(hostname)-sh
fi

if [[ -x $(which keychain) ]];then
#    eval $(keychain --lockwait 60 --eval id_rsa jah_id_ecdsa jph_bebo_id_ecdsa)
eval $(keychain -q --lockwait 60 --eval id_rsa jah_id_ecdsa augur_id_rsa jph_digitalocean)
fi

export SSH_AUTH_SOCK
export SSH_AGENT_PID


#eval $(ssh-agent)

function cleanup {
    echo "Killing SSH-Agent"
        kill -9 $SSH_AGENT_PID
    }

#trap cleanup EXIT

# rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
