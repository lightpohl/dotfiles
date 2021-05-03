alias sudo="sudo "
alias ls="ls -A1 -G"
alias vim="nvim"

alias unsafe-git-branch-purge='git branch | grep -v "\*" | grep -v "master" | grep -v "main" | grep -v "staging" | grep -v "develop" | xargs -n 1 git branch -D'

ZSH_THEME="avit"
ZSH_TMUX_AUTOSTART=true

plugins=(
  tmux
  nvm
 )  

 export RIPGREP_CONFIG_PATH="~/.ripgreprc"

