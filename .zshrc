alias sudo="sudo "
alias ls="ls -A1 -G"
alias vim="nvim"

# Install dracula theme: https://draculatheme.com/zsh
ZSH_THEME="dracula/dracula"
ZSH_TMUX_AUTOSTART=true

plugins=(
  git
  tmux
  nvm
 )  

 export RIPGREP_CONFIG_PATH="~/.ripgreprc"
 
 export PATH="$HOME/.npm-global/bin:$PATH"
