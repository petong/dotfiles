# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

# bindkey "^[[A" history-beginning-search-backward
bindkey "^[[A" atuin-up-search
bindkey "^[[B" history-beginning-search-forward
# bindkey "^[OA" history-beginning-search-backward
bindkey "^[OA" atuin-up-search
bindkey "^[OB" history-beginning-search-forward

