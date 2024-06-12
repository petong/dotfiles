# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR}/.antidote/antidote.zsh
antidote load ${ZDOTDIR}/.zsh/zsh_plugins.txt


#om-my-posh
if (( $+commands[oh-my-posh] )); then
  eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/pure.omp.json)"
# Initialize Starship prompt
elif (( $+commands[starship] )); then
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

if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
#
# fzf
if (( $+commands[fzf] )); then
  eval "$(fzf --zsh)"
fi

if (( $+commands[thefuck] )); then
  eval $(thefuck --alias)
fi

# zoxide
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd cd)"
fi

#
# # custom shell configurations
[ -e "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -e "$HOME/.zsh/appearance.zsh" ] && source "$HOME/.zsh/appearance.zsh"
[ -e "$HOME/.zsh/completion.zsh" ] && source "$HOME/.zsh/completion.zsh"
[ -e "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -e "$HOME/.zsh/keybindings.zsh" ] && source "$HOME/.zsh/keybindings.zsh"
[ -e "$HOME/.zsh/options.zsh" ] && source "$HOME/.zsh/options.zsh"
[ -f ~/.zsh.local ] && source ~/.zsh.local



zstyle ':completion:*' menu select
fpath+=~/.zfunc
