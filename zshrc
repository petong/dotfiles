# set up zplugin
local -A ZINIT
ZINIT[HOME_DIR]="${ZDOTDIR:-$HOME}/.zinit"
if [[ ! -d "${ZINIT[HOME_DIR]}" ]]; then
  mkdir -p "${ZINIT[HOME_DIR]}"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT[HOME_DIR]}/bin"
fi
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# zinit customization goes here
zinit light zdharma-continuum/zui

#zinit for annexes zsh-users+fast console-tools fuzzy

# switch to power10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zinit ice wait"0" blockf lucid
#zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions

# nvm
NVM_LAZY_LOAD=true
zinit light "lukechilds/zsh-nvm"

# npm
zinit light 'lukechilds/zsh-better-npm-completion'

# kubectl
zinit light 'nnao45/zsh-kubectl-completion'
zinit light 'johanhaleby/kubetail'

# fzf binary, completion, and zsh key bindings
#zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin
#zinit ice wait lucid multisrc'shell/{key-bindings,completion}.zsh'
#zinit light junegunn/fzf
zinit pack for fzf

# needed to pull packages
#zinit light zinit-zsh/z-a-bin-gem-node
zinit light zdharma-continuum/zinit-annex-bin-gem-node

# pyenv
#zinit pack for pyenv
#zinit lucid as'command' pick'bin/pyenv' atinit'export PYENV_ROOT="$PWD"' \
#    atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#    atpull"%atclone" src"zpyenv.zsh" nocompile'!' for \
#        pyenv/pyenv
zinit pack for pyenv

# Load the pure theme, with zsh-async library that's bundled with it
#zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

# diff-so-fancy
zinit ice as"program" pick"bin/git-dsf" wait"0" lucid
zinit light zdharma-continuum/zsh-diff-so-fancy

# completions from prezto
zinit snippet PZT::modules/completion/init.zsh

# oh-my-zsh kubectl aliases
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/kubectl.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

# needs to be run before last plugin is loaded
zinit ice atinit"autoload compinit; mkdir -p $HOME/.cache/zsh; compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION; zpcdreplay" wait"1" silent
zinit light zdharma-continuum/fast-syntax-highlighting

## end zinit
#############

# editor setup
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  export VISUAL=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
  export VISUAL=vim
fi

# golang setup
export GOPATH=$HOME/go

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
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
[ -f ~/.zinit/plugins/fzf/shell/key-bindings.zsh ] && source ~/.zinit/plugins/fzf/shell/key-bindings.zsh

# kubie configs
[ -f ~/.zsh/kc.zsh ] && source ~/.zsh/kc.zsh
[ -f ~/.zsh.local ] && source ~/.zsh.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pyenv
eval "$(pyenv init --path)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
