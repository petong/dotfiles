zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.cache/zsh/zcompcache-$ZSH_VERSION"
#
#zstyle ':completion:*:default' menu select=4
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#
#
#

#zstyle ':completion:*' completer _complete _approximate:-one _complete:-extended _approximate:-four
#zstyle ':completion:*:approximate-one:*' max-errors 1
#zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*'
#zstyle ':completion:*:approximate-four:*' max-errors 4

#
#
#
#
#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#
## format
#zstyle ':completion:*' format 'Completing %d'
#
#zstyle ":completion:*:descriptions" format "%B%d%b"
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
#zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
#
##zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
##zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%}'
##zstyle ':completion:*:descriptions' format '%B%d%b'
##zstyle ':completion:*:descriptions' format $'%{\e[0;33m%}%d:%{\e[0m%}'
#
#
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=2
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#
