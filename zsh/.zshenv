#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

export GOPATH="$HOME/Development/GoProjects"
export PATH="$GOPATH/bin:$PATH"

#if [[ $- != *i* ]]; then
#  export NVM_DIR="$HOME/.nvm"
#  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#
#  export PYENV_ROOT="$HOME/.pyenv"
#  export PATH="$PYENV_ROOT/bin:$PATH"
#
#  if command -v pyenv 1>/dev/null 2>&1; then
#    eval "$(pyenv init -)"
#  fi
# fi

