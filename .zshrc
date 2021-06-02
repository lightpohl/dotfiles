alias sudo="sudo "
alias ls="ls -A1 -G"
alias vim="nvim"

# Install dracula theme: https://draculatheme.com/zsh
ZSH_THEME="dracula/dracua"
ZSH_TMUX_AUTOSTART=true

plugins=(
  git
  tmux
  nvm
 )  

 export RIPGREP_CONFIG_PATH="~/.ripgreprc"

