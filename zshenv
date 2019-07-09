# any modifications to path go in this file
path=( ${HOME}/bin /usr/local/bin /usr/local/sbin $path)

# pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# added by travis gem
[ -f /Users/jph/.travis/travis.sh ] && source /Users/jph/.travis/travis.sh

