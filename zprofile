export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:-$HOME}"

# golang setup
export GOPATH=$HOME/go

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history
export SAVEHIST=1000000000



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



typeset -ga sources
# any modifications to path go in this file
path=(
  ${HOME}/.rd/bin
  ${HOME}/.local/bin
  ${HOME}/.zinit/polaris/bin
  ${HOME}/bin
  ${HOME}/ripple/bin
  /usr/local/bin
  /usr/local/sbin
  $path
  ${HOME}/go/bin
  ${HOME}/.cargo/bin
  ${HOME}/.krew/bin
)
cdpath=( $HOME/git )

# google cloud sdk
#sources+="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc "
#sources+="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

set +x

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end


# set path accoring to os type
#case $OSTYPE {
#    linux*)
#    ;;
#    darwin*)
#      PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
#    ;;
#}
eval "$(/opt/homebrew/bin/brew shellenv)"
