export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# Clone antidote if necessary.
[[ -d ${ZDOTDIR}/.zsh/antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR}/.zsh/antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR}/.zsh/antidote/antidote.zsh
antidote load ${ZDOTDIR}/.zsh/zsh_plugins.txt


# Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Initialize Starship prompt
eval "$(starship init zsh)"

# Custom configurations
# Add your custom Zsh configurations here


# editor setup
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  export VISUAL=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
  export VISUAL=vim
fi

HISTFILE=~/.zsh_history

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

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[ -f ~/.zinit/plugins/fzf/shell/key-bindings.zsh ] && source ~/.zinit/plugins/fzf/shell/key-bindings.zsh
eval "$(fzf --zsh)"

# kubie configs
[ -f ~/.zsh/kc.zsh ] && source ~/.zsh/kc.zsh
[ -f ~/.zsh.local ] && source ~/.zsh.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pyenv
eval "$(pyenv init --path)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

eval "$(direnv hook zsh)"

########## 1password #######################
#
#eval "$(op completion zsh)"; compdef _op op
#eval "$(op completion zsh)"
#
#############################################

########### thefuck
#
eval $(thefuck --alias)

####################################[ vault: vault addr prompt ]####################################
# Create a Powerlevel10k prompt segment that shows that value of $VAULT_ADDR if set.
function prompt_vault_addr() {
  if [[ -n $VAULT_ADDR ]]; then
    p10k segment -i '🔐' -f yellow -b blue -t "${${VAULT_ADDR#https:\/\/}%:*}"
  fi
}

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( vault_addr $POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS )

#function prompt_vault_addr() {
#  if [[ -n $VAULT_ADDR ]]; then
#    p10k segment -i '🔐' -f yellow -b blue -t "${${VAULT_ADDR#https:\/\/}%:8200}"
#  fi
#}

# Add it to the right prompt.
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=vault_addr
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+=vault_addr

# Only show it when running 'vault'.
typeset -g POWERLEVEL9K_VAULT_ADDR_SHOW_ON_COMMAND='vault'

typeset -g POWERLEVEL9K_VAULT_ADDR_CLASSES=(
    '*prod*'     PROD       # These values are examples that are unlikely
    '*staging*'  STAGING    # to match your needs. Customize them as needed.
    '*'          OTHER)

typeset -g POWERLEVEL9K_VAULT_ADDR_OTHER_FOREGROUND=55
typeset -g POWERLEVEL9K_VAULT_ADDR_STAGING_FOREGROUND=72
typeset -g POWERLEVEL9K_VAULT_ADDR_PROD_FOREGROUND=160
typeset -g POWERLEVEL9K_VAULT_ADDR_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'



zstyle ':completion:*' menu select
fpath+=~/.zfunc
