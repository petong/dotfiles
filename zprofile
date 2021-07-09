typeset -ga sources
# any modifications to path go in this file
path=(
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
sources+="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc "
sources+="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

set +x

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end

# pyenv
#eval "$(pyenv init -)"
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# set path accoring to os type
#case $OSTYPE {
#    linux*)
#    ;;
#    darwin*)
#      PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
#    ;;
#}
