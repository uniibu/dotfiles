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
source ~/.completion.bash
export TERM=xterm-256color

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;93m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;96m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtpur}"
nameC="${txtblu}"
hostC="${txtpur}"
pathC="${txtcyn}"
gitC="${txtpur}"
pointerC="${txtwht}"
normalC="${txtrst}"

# Red pointer for root
if [ "${UID}" -eq "0" ]; then
    pointerC="${txtred}"
fi

PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
