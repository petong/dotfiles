# any modifications to path go in this file
path=( ${HOME}/bin ${HOME}/ripple/bin  /usr/local/bin /usr/local/sbin $path ${HOME}/go/bin)
cdpath=( $HOME/git )

# pyenv
#eval "$(pyenv init -)"
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# set path accoring to os type
case $OSTYPE {
    linux*)
    ;;
    darwin*)
      PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
    ;;
}
