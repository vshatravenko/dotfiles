# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH

export GOPATH=$HOME/work/go
export PATH=$GOPATH/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias gst="git status"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gb="git branch"
alias gco="git checkout"
alias gc="git commit"
alias glg="git log"
alias gp="git push"
alias gpf="git push -f"
alias gf="git fetch"
alias gal="git add ."
alias amen="git commit --amend"

function amendate() {
  amen --date="`date -R`"
}

# Docker

function dstop() {
  docker stop $(docker ps -q)
}

function drm() {
  docker rm -f $(docker ps -aq)
}

function dclean() {
  docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
}

function mahsql() {
  docker run --name default-db -e MYSQL_ROOT_PASSWORD=changeme -p 3306:3306 -d mysql:5.7
}

alias dps="docker ps"

alias dc="docker-compose"
alias dup="docker-compose up"
alias down="docker-compose down"
alias dbuild="docker-compose build"

# K8s

alias kube="kubectl"
alias kpo="kubectl get po"
alias kg="kubectl get"
alias kdel="kubectl delete"
alias ke="kubectl edit"
alias kex="kubectl exec"
alias kdesc="kubectl describe"
alias kall="kubectl get all"

# Terraform

alias ter="terraform"
alias tout="terraform output"
alias tinit="terraform init"
alias tdestr="terraform destroy"

alias untar="tar zxvf"

function tapply()
{
  terraform init
  terraform apply
}

# Gems

alias be="bundle exec"
alias gin="gem install --no-ri --no-rdoc"

# Etc

alias zshconf="vim ~/.zshrc && source ~/.zshrc"

# Arch

alias sp="sudo pacman"
alias sc="sudo systemctl"

function local_peatio()
{
  export DATABASE_HOST="127.0.0.1"
  export DATABASE_PASS="changeme"
  export DATABASE_USER="root"
}

export PATH=~/work/kite/bin:$PATH


# export CHANGELOG_GITHUB_TOKEN="blm"

export DOCKER_ID_USER="valshatravenko"

export BOSH_ALL_PROXY=socks5://localhost:5000

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -C aws_completer aws

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/d33p/data/google-cloud-sdk/path.zsh.inc' ]; then source '/home/d33p/data/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/d33p/data/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/d33p/data/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)
source <(kops completion zsh)
source <(helm completion zsh)
