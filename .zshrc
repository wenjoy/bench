# Path to your oh-my-zsh installation.
export ZSH=/Users/wenjoy/.oh-my-zsh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.


# ZSH_THEME="pure"
 ZSH_THEME="agnoster"
# ZSH_THEME="sonicradish"
 #ZSH_THEME="frisk"
 #ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.  HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node colored-man-pages z nvm web-search zsh-autosuggestions zsh-syntax-highlighting)
# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# my config
# cannot find out where seted the unused PATH,have to reset it 
# for error: "ValueError: unknown locale: UTF-8"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/lib
export PATH=$PATH:/opt/X11/bin
export PATH="$PATH:/Users/wenjoy/workspace/tools/mongodb-osx-x86_64-3.2.1/bin"
export PATH="$PATH:/Users/wenjoy/workspace/tools/apache-maven-3.3.3/bin"
export PATH="$PATH:/Users/wenjoy/workspace/tools/shelltool"
#dev of java
export PATH="$PATH:/Users/wenjoy/workspace/tools/Android/sdk/platform-tools"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"

export NVM_DIR="/Users/wenjoy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias subl='open -a "Sublime Text"'
alias sayy='say you are so handsome!'
# alias vim='/usr/local/Cellar/vim/7.4.2152/bin'

alias mi="mvn install"
alias mc="mvn compile"
alias mci="mvn clean install"
alias mkp="cd PortalApp;mi;cd ../PortalTest;mc; cd .."
alias mkh="cd HudApp;mi;cd ../PortalTest;mc; cd .."
alias mkl="cd ./LoginPage;mi;cd ../PortalTest;mc; cd .."
alias ip="ifconfig|grep inet"
alias runmongo='mongod --dbpath /Users/wenjoy/workspace/feitian/database'
alias stopmongo='mongo admin --eval "db.shutdownServer()"'
alias stopnm='pm2 kill & stopmongo'
#alias vim='/usr/local/bin/vim' #vim8.0
alias mybase='git fetch && git rebase origin/dev'
alias rm='rmtrash'

PROJECTTEMPLATE='/Users/wenjoy/workspace/studio/pro_schema'
alias givemekoa="cp -r $PROJECTTEMPLATE/koa/* ."
alias givemewebpack="cp -r $PROJECTTEMPLATE/webpack/* ."
function backup(){
  if [[ -z $1 ]];then
    printf "${RED}need schema path"
  elif [[ -z $2 ]];then
    printf "${RED}need git backup message"
  else
    printf "begain backup"
    schema_dir=$PROJECTTEMPLATE/$1
    cp package.json webpack.config.js ${schema_dir}
    cd $schema_dir
    git ca "$2"
    if [[ $? -eq 0 ]];then
      printf "${GREEN}backup success"
    else
      printf "${RED}backup failed"
    fi
    cd -
  fi
}

function mkcd(){mkdir -p "$1" && cd "$1"}
function toggleSpacevim (){
    if test -f ~/.vimrc
    then
        echo "change to space vim"
        mv ~/.vim ~/.vim_back
        mv ~/.vimrc ~/.vimrc_back
        ln -s ~/.SpaceVim ~/.vim
    else
        echo "change to nvim"
        rm ~/.vim
        mv ~/.vim_back ~/.vim
        mv ~/.vimrc_back ~/.vimrc
    fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#note
#
#delete first N files us `ls`
#ls -1t|head -n 13|xargs rm
#defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
