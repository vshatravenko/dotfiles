# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

alias dps="docker ps"

alias dup="docker-compose up"
alias down="docker-compose down"
alias dbuild="docker-compose build"

# K8s

alias kube="kubectl"
alias kpo="kubectl get po"
alias kg="kubectl get"
alias kdel="kubectl delete"
alias ke="kubectl edit"
alias kexec="kubectl exec"
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

function local_peatio()
{
  export DATABASE_HOST="127.0.0.1"
  export DATABASE_PASS="changeme"
  export DATABASE_USER="root"
}

export PATH=~/work/kite/bin:$PATH


export CHANGELOG_GITHUB_TOKEN="61474e68c24a036542d4ebb9c3002a3f6cbba669"

export DOCKER_ID_USER="valshatravenko"

export AWS_ACCESS_KEY_ID="AKIAIA5RCRHZU2HMM4BQ"
export AWS_SECRET_ACCESS_KEY="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"

export BOSH_ALL_PROXY=socks5://localhost:5000

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/vault vault
#complete -C aws_completer aws

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/d33p/data/google-cloud-sdk/path.zsh.inc' ]; then source '/home/d33p/data/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/d33p/data/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/d33p/data/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)
# source <(kops completion zsh)
source <(helm completion zsh)
