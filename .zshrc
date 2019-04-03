# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Ansible Vault
export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/.ansible_vault.txt

# PATHS
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$PATH:$HOME/.protoc/bin
export PATH=$HOME/bin:$PATH
export VIMPATH=$HOME/.config/nvim/init.vim
export ZSHRC=$HOME/.zshrc
export ALARC=$HOME/.config/alacritty/alacritty.yml
## Language Specific
# GO
export GO111MODULE=auto
export GOPROXY="direct"
# Path to your oh-my-zsh installation.
export ZSH="/Users/alalee/.oh-my-zsh"

ZSH_THEME="hyperzsh"

# fasd
eval "$(fasd --init auto)"

# ALIASES
alias pro='cd ~/projects'
alias gco='git checkout'
alias gc='git commit'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gst='git status'
alias vimc='nvim $VIMPATH'
alias zshc='nvim $ZSHRC'
alias alac='nvim $ALARC'
alias sz='source $ZSHRC'
alias sv='source $VIMPATH'
alias cat='bat'
alias ls='exa'
alias j='fasd_cd -d'

gpu() {
  BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
  git push --set-upstream origin $BRANCH
}

zupload() {
  grunt zendesk-dist
  node scripts/uploadDisted.js
}

pk() {
  PORT=$1
  lsof -ti:$PORT | xargs kill
}

plugins=(
  git,
  zsh-autosuggestions,
  terraform,
  kubectl,
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Kubernetes
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# Heroku environmental vars
# added by travis gem
[ -f /Users/alalee/.travis/travis.sh ] && source /Users/alalee/.travis/travis.sh

# DOCKER
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Syntax Highlighting
source /Users/alalee/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# added by travis gem
[ -f /Users/alalee/.travis/travis.sh ] && source /Users/alalee/.travis/travis.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

complete -o nospace -C /Users/alalee/go/bin/vault vault

complete -o nospace -C /Users/alalee/go/bin/terraform terraform

# fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env`
