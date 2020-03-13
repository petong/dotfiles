# set up zplugin
local -A ZINIT
ZINIT[HOME_DIR]="${ZDOTDIR:-$HOME}/.zinit"
if [[ ! -d "${ZINIT[HOME_DIR]}" ]]; then
  mkdir -p "${ZINIT[HOME_DIR]}"
  git clone https://github.com/zdharma/zinit.git "${ZINIT[HOME_DIR]}/bin"
fi
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit customization goes here
zinit light zdharma/zui

#zinit ice wait"0" blockf lucid
#zinit light zsh-users/zsh-completions

#zinit ice wait"0" atload"_zsh_autosuggest_start" lucid
#zinit light zsh-users/zsh-autosuggestions

# nvm
NVM_LAZY_LOAD=false
zinit light "lukechilds/zsh-nvm"

# npm
zinit light 'lukechilds/zsh-better-npm-completion'

# fzf binary, completion, and zsh key bindings
zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'

# Load the pure theme, with zsh-async library that's bundled with it
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

# diff-so-fancy
zinit ice as"program" pick"bin/git-dsf" wait"0" lucid
zinit light zdharma/zsh-diff-so-fancy

# completions from prezto
zinit snippet PZT::modules/completion/init.zsh

# needs to be run before last plugin is loaded
zinit ice atinit"autoload compinit; mkdir -p $HOME/.cache/zsh; compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION; zpcdreplay" wait"1" silent
zinit light zdharma/fast-syntax-highlighting

## end zinit
#############

# ZSH setup
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  export VISUAL=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
  export VISUAL=vim
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=20480
SAVEHIST=10240
HISTFILE=~/.zsh_history

# custom shell configurations
[ -e "$HOME/.zsh/aliases.zsh" ] && source "$HOME/.zsh/aliases.zsh"
[ -e "$HOME/.zsh/appearance.zsh" ] && source "$HOME/.zsh/appearance.zsh"
[ -e "$HOME/.zsh/completion.zsh" ] && source "$HOME/.zsh/completion.zsh"
[ -e "$HOME/.zsh/functions.zsh" ] && source "$HOME/.zsh/functions.zsh"
[ -e "$HOME/.zsh/keybindings.zsh" ] && source "$HOME/.zsh/keybindings.zsh"
[ -e "$HOME/.zsh/options.zsh" ] && source "$HOME/.zsh/options.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zsh.local ] && source ~/.zsh.local
