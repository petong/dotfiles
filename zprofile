export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:-$HOME}"
export GPG_TTY=$(tty)
# Locale settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# History settings
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=100000

# Editor selection with complete fallback chain
if (( $+commands[nvim] )); then
    export EDITOR=nvim
    export VISUAL=nvim
elif (( $+commands[vim] )); then
    export EDITOR=vim
    export VISUAL=vim
else
    export EDITOR=vi
    export VISUAL=vi
fi

# Path setup - add all custom paths first
path=(
    ${HOME}/.rd/bin
    ${HOME}/.local/bin
    ${HOME}/bin
    ${HOME}/ripple/bin
    /usr/local/bin
    /usr/local/sbin
    $path
    ${HOME}/go/bin
    ${HOME}/.cargo/bin
    ${HOME}/.krew/bin
    /opt/homebrew/bin
)

# Now that /opt/homebrew/bin is in path, we can check for and evaluate brew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
