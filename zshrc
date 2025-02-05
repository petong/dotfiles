# Use $ZDOTDIR if defined, fallback to $HOME
ZDOTDIR=${ZDOTDIR:-$HOME}

# -----------------------------------------------------------------------------
# 1. Ensure Antidote is installed.
# -----------------------------------------------------------------------------
ANTIDOTE_DIR="$ZDOTDIR/.antidote"
ANTIDOTE_FILE="$ANTIDOTE_DIR/antidote.zsh"

if [ ! -f "$ANTIDOTE_FILE" ]; then
  echo "Antidote not found. Installing Antidote..."
  # Clone the Antidote repo (you can adjust depth or use the installer script if you like)
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
  fi

# Load Antidote and your plugins list.
source "$ANTIDOTE_FILE"
antidote load "$ZDOTDIR/.zsh/zsh_plugins.txt"

#om-my-posh
if (( $+commands[oh-my-posh] )); then
  # eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/pure.omp.json)"
  # eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/tokyonight_storm.omp.json)"
  eval "$(oh-my-posh init zsh --config ~/git/dotfiles/jph.omp.yaml)"
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

# atuin
if (( $+commands[atuin] )); then
  eval "$(atuin init zsh)"
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


fpath+=~/.zfunc

