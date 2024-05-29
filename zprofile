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
