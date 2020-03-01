[ -f ~/.bash_aliases ] && source ~/.bash_aliases

[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if [ -d ~/.pyenv ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
fi

# computer-specific bash configs
[ -f ~/.config.bash ] && source ~/.config.bash

# end-of-shell-initialization commands
command -v pyenv 1>/dev/null 2>&1 && eval "$(pyenv init -)"

[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

true # exit with success, as not having the last initialization package will exit with an error code
