# Clone antidote if necessary.
[[ -d ${ZDOTDIR}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR}/.antidote/antidote.zsh
antidote load ${ZDOTDIR}/.zsh/zsh_plugins.txt

# Initialize Starship prompt
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init zsh)"
fi

# pyenv
# Load pyenv
if (( $+commands[pyenv] )); then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
if (( $+commands[pyenv-virtualenv-init] )); then
  eval "$(pyenv virtualenv-init -)"
fi

eval "$(direnv hook zsh)"

eval "$(fzf --zsh)"

eval $(thefuck --alias)

#autoload -Uz compinit
#compinit
#which kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
#zinit cdreplay -q # <- execute compdefs provided by rest of plugins


# custom shell configurations
[ -e "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -e "$HOME/.zsh/appearance.zsh" ] && source "$HOME/.zsh/appearance.zsh"
[ -e "$HOME/.zsh/completion.zsh" ] && source "$HOME/.zsh/completion.zsh"
[ -e "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -e "$HOME/.zsh/keybindings.zsh" ] && source "$HOME/.zsh/keybindings.zsh"
[ -e "$HOME/.zsh/options.zsh" ] && source "$HOME/.zsh/options.zsh"
[ -f ~/.zsh.local ] && source ~/.zsh.local


########## 1password #######################
#
#eval "$(op completion zsh)"; compdef _op op
#eval "$(op completion zsh)"
#
#############################################


####################################[ vault: vault addr prompt ]####################################
# Create a Powerlevel10k prompt segment that shows that value of $VAULT_ADDR if set.
#function prompt_vault_addr() {
#  if [[ -n $VAULT_ADDR ]]; then
#    p10k segment -i '🔐' -f yellow -b blue -t "${${VAULT_ADDR#https:\/\/}%:*}"
#  fi
#}
#
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( vault_addr $POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS )

#function prompt_vault_addr() {
#  if [[ -n $VAULT_ADDR ]]; then
#    p10k segment -i '🔐' -f yellow -b blue -t "${${VAULT_ADDR#https:\/\/}%:8200}"
#  fi
#}

# Add it to the right prompt.
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=vault_addr
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+=vault_addr

# # Only show it when running 'vault'.
# typeset -g POWERLEVEL9K_VAULT_ADDR_SHOW_ON_COMMAND='vault'
#
# typeset -g POWERLEVEL9K_VAULT_ADDR_CLASSES=(
#     '*prod*'     PROD       # These values are examples that are unlikely
#     '*staging*'  STAGING    # to match your needs. Customize them as needed.
#     '*'          OTHER)
#
# typeset -g POWERLEVEL9K_VAULT_ADDR_OTHER_FOREGROUND=55
# typeset -g POWERLEVEL9K_VAULT_ADDR_STAGING_FOREGROUND=72
# typeset -g POWERLEVEL9K_VAULT_ADDR_PROD_FOREGROUND=160
# typeset -g POWERLEVEL9K_VAULT_ADDR_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'
#


zstyle ':completion:*' menu select
fpath+=~/.zfunc
