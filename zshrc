# set up zplugin
local -A ZPLGM
ZPLGM[HOME_DIR]="${ZDOTDIR:-$HOME}/.zplugin"
if [[ ! -d "${ZPLGM[HOME_DIR]}" ]]; then
  mkdir -p "${ZPLGM[HOME_DIR]}"
  git clone https://github.com/zdharma/zplugin.git "${ZPLGM[HOME_DIR]}/bin"
fi
source "${ZPLGM[HOME_DIR]}/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

module_path+=( "/Users/jph/.zplugin/bin/zmodules/Src" )
zmodload zdharma/zplugin



# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# fzf env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplugin customization goes here
zplugin light zdharma/zui
zplugin light zdharma/zplugin-crasis

zplugin ice wait"0" blockf lucid
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start" lucid
zplugin light zsh-users/zsh-autosuggestions


#zplugin light zsh-users/zsh-syntax-highlighting
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

# Load the pure theme, with zsh-async library that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# diff-so-fancy
zplugin ice as"program" pick"bin/git-dsf" wait"0" lucid
zplugin light zdharma/zsh-diff-so-fancy

# needs to be run last ?
zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting

# This one to be ran just once, in interactive session
#zplugin creinstall %HOME/my_completions  # Handle completions without loading any plugin, see "clist" command

# ZSH setup
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  export VISUAL=nvim
  alias vi=$EDITOR
  alias vim=$EDITOR
elif (( $+commands[vim] )); then
  export EDITOR=vim
  export VISUAL=vim
  alias vi=$EDITOR
  alias vim=$EDITOR
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=20480
SAVEHIST=10240
HISTFILE=~/.zsh_history

# custom shell configurations
[ -e "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -e "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -e "$HOME/.zsh/appearance.zsh" ] && source "$HOME/.zsh/appearance.zsh"
[ -e "$HOME/.zsh/completion.zsh" ] && source "$HOME/.zsh/completion.zsh"
[ -e "$HOME/.zsh/keybindings.zsh" ] && source "$HOME/.zsh/keybindings.zsh"
[ -e "$HOME/.zsh/options.zsh" ] && source "$HOME/.zsh/options.zsh"
