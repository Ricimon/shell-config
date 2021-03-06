# https://stackoverflow.com/a/26759734
if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
elif [ -x "$(command -v vim)" ]; then
    export EDITOR='vim'
elif [ -x "$(command -v vi)" ]; then
    export EDITOR='vi'
fi

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export PYTHON_CONFIGURE_OPTS="--enable-shared"
if [ -d ~/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

# computer-specific bash configs
[ -f ~/.config.bash ] && source ~/.config.bash

# Don't let RVM set up shell to load RVM
export rvm_ignore_dotfiles=yes
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# end-of-shell-initialization commands
# enable pyenv shims, autocompletion, and virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

true # exit with success, as not having the last initialization package will exit with an error code
