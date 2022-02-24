alias sudo="sudo "
alias ls="ls -A1 -G"
alias vim="nvim"

ZSH_THEME="avit"

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
plugins=(
  git
  nvm
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
 )  

 export RIPGREP_CONFIG_PATH="~/.ripgreprc"
 
 export PATH="$HOME/.npm-global/bin:$PATH"
