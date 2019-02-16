# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jph/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jph/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jph/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jph/.fzf/shell/key-bindings.zsh"

