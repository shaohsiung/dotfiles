# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/luca/.oh-my-zsh"

# Enable smart completion
# autoload -U compinit
# compinit

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true" 

####################################################################
# ZSH THEMES
####################################################################
# ZSH_THEME="awesomepanda"
ZSH_THEME="agnoster"
# ZSH_THEME="Avit"

####################################################################
# Zsh Plugins 
####################################################################
plugins=(
  git 
  history 
  jsontools 
  
  zsh-syntax-highlighting 
  zsh-autosuggestions 
)

source $ZSH/oh-my-zsh.sh

####################################################################

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
# export PS1='[\u@dev \W]\$ '
export DEV="$HOME/dev"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# GO envs
export GOROOT=/usr/local/go
export GOPATH=$DEV/golang
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export GO111MODULE=on 
export GOPROXY=https://goproxy.cn,direct 
export GOPRIVATE=
export GOSUMDB=off

####################################################################
# Aliases 
####################################################################
# source ~/aliasrc
alias -g G='| grep -i' # Example: ls -l G spring
alias pg="ping www.google.com"
alias pb="ping www.baidu.com"
# Kill Process by Port
# lsof -P | grep ':PortNumber' | awk '{print $2}' | xargs kill -9

# Kill Process by PID
# ps -aux & kill -s 9 PID

# HTTP Proxy
alias ehp="export http_proxy='http://localhost:8010' && curl cip.cc"
alias whichp="curl cip.cc"
alias uhp="unset http_proxy && curl cip.cc"

# Git
alias gst="git status"
alias gcm="git commit -m"
alias gl="git log --oneline --decorate --color"
alias gh="git log --all --graph --decorate --oneline"

# Node
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"

# Docker
alias drds="docker run -d --name iredis -p 6379:6379 redis"
alias dms5="docker run --name imysql5.7 -e MYSQL_ROOT_PASSWORD=root --platform linux/x86_64 -p 3306:3306 -d mysql:5.7"
alias dms8="docker run --name imysql8 -e MYSQL_ROOT_PASSWORD=root --platform linux/x86_64 -p 3306:3306 -d mysql:8"

####################################################################
# Functions 
####################################################################
# source ~/functionrc
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else    
        echo "'$1' is not a valid file!"
    fi
}

function mkcd() {
    mkdir $1 && cd $1
}

##################
# Greeting Idioms
##################
python3 idioms.py | parrotsay
