# any modifications to path go in this file
path=( ${HOME}/bin /usr/local/bin /usr/local/sbin $path)

# pyenv
eval "$(pyenv init -)"

# added by travis gem
[ -f /Users/jph/.travis/travis.sh ] && source /Users/jph/.travis/travis.sh

