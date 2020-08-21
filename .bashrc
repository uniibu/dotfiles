HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file instead of overwrite
shopt -s histappend

alias cp='cp -Rv'
alias ls='ls --color=auto -ACF'
alias ll='ls --color=auto -alF'
alias grep='grep --color=auto'
alias grepw='grep --color=auto -Hrnwi'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias wget='wget -c'

alias docker='sudo docker'
alias docker-compose='sudo docker-compose'

function cd () {
    builtin cd "$1"
    ls -ACF
}
export PATH=$PATH:/usr/local/bin:/usr/local/go/bin:~/.local/bin:$GOPATH/bin
export GOPATH=~/go

export EDITOR=/usr/bin/nano

COLOR_NONE="\e[0m"
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
GRAY="\033[0;37m"
BOLD_RED="\033[1;31m"
BOLD_GREEN="\033[1;32m"
BOLD_YELLOW="\033[1;33m"
BOLD_BLUE="\033[1;34m"
BOLD_PURPLE="\033[1;35m"
BOLD_CYAN="\033[1;36m"
WHITE="\033[1;37m"

git_branch() {
	local git_branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
	local git_stat="`git status -unormal 2>&1`"

	local color_stat=''
	if [[ "$git_stat" =~ "nothing to commit" ]]; then
		color_stat="$GREEN"
	elif [[ "$git_stat" =~ "nothing added to commit but untracked files present" ]]; then
		color_stat="$LIGHT_GREEN"
	elif [[ "$git_stat" =~ "# Untracked files:" ]]; then
		color_stat="$YELLOW"
	else
		color_stat="$RED"
	fi

	echo -en "$color_stat$git_branch"
}

PS1="\[$BOLD_GREEN\][\[$BOLD_YELLOW\]\u\[$BOLD_GREEN\]@\[$BOLD_BLUE\]\h:\[$BOLD_RED\]"'`pwd`'"\[$BOLD_GREEN\]] "'`git_branch`'" \[$GRAY\]\t\n\[$BOLD_GREEN\]"'\$'"\[$COLOR_NONE\] "

# Terminal
# screen-256color if inside tmux, xterm-256color otherwise
if [[ -n "$TMUX" ]]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

# PATH for local settings
export PATH="~/.local/bin/:$PATH"
source ~/.completion.bash
[ -s "$HOME/init.sh" ] && \. "$HOME/init.sh" # initial setup, will auto delete it self

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

