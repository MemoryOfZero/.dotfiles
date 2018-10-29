# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Start ssh-agent and add keys if it is not up
#if [[ -z $SSH_AUTH_SOCK ]]; then
#    eval `ssh-agent -s`
#    ssh-add
#fi

alias edit="nvim"
alias cd..="cd .."
alias rm="rm"
alias t="tmux"
alias ta="tmux a"
alias tl="tmux ls"
alias s="ssh"
alias shosts="grep -P '^Host ([^*]+)$' $HOME/.ssh/config | sed 's/Host //'"
alias aliases="alias | less"
alias pbcopy="xclip -selection clipboard"

# Run ll when changing working dir
function chpwd {
    ls -a
}

function dev {
    cd ~/Development/$1
}

function dots {
    cd ~/.dotfiles/$1
}

alias pydt="python -m doctest -v"
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

function avenv {
    if [[ -z $1 && -s venv/bin/activate ]]; then
        source venv/bin/activate
    elif [[ ! -z $1 && -s $1/bin/activate ]]; then
        source $1/bin/activate
    else
        echo "Please provide a proper venv folder."
    fi
}

function genkey {
    if [ -z $1 ]; then
        ssh-keygen -t ed25519 -a 100
    elif [ $1 == "rsa" ]; then
        ssh-keygen -t rsa -b 4096 -o -a 100
    else
        ssh-keygen -t ed25519 -a 100
    fi
}

function cpkey {
    if [[ -s ~/.ssh/$1.pub ]]; then
        local LOCATION=~/.ssh/$1.pub
    elif [[ -s ~/.ssh/$1 && $1 =~ ".+\.pub" ]]; then
        local LOCATION=~/.ssh/$1
    elif [[ -s $1.pub ]]; then
        local LOCATION=$1.pub
    elif [[ -s $1 && $1 =~ ".+\.pub" ]]; then
        local LOCATION=$1
    fi

    if [[ ! -z $LOCATION ]]; then
        cat $LOCATION | pbcopy
        echo "Copied public key at $LOCATION to clipboard."
    else
        echo "Cannot find location of public key."
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
    user
    host
    jobs
    dir
#    git
#    hg
#    package
#    node
#    ruby
#    elixir
#    xcode
#    swift
#    golang
#    php
#    rust
#    haskell
#    julia
#    docker
#    aws
    venv
#    conda
#    pyenv
#    dotnet
#    ember
#    kubecontext
    line_sep
    exit_code
    char
)

SPACESHIP_RPROMPT_ORDER=(
    vi_mode
)

# colours: red, blue, green, cyan, yellow, magenta, black, white
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true #doesn't seem to work??

#SPACESHIP_CHAR_SYMBOL="⚡︎➜ "

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX=""
SPACESHIP_TIME_SUFFIX=""
SPACESHIP_TIME_FORMAT="%D{%b %d  %H:%M}"

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="cyan"
SPACESHIP_USER_COLOR_ROOT="green"

SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_SHOW_FULL=true
SPACESHIP_HOST_PREFIX=" at "
SPACESHIP_HOST_COLOR=200
SPACESHIP_HOST_COLOR_SSH="magenta"

SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_GIT_STATUS_COLOR=200

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL="✘ "

