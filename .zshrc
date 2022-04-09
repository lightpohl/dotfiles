alias sudo="sudo "
alias ls="ls -A1 -G"
alias vim="nvim"

ZSH_THEME="avit"

plugins=(
  git
  nvm
  fzf
  # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
  zsh-syntax-highlighting 
 )  
 
 export PATH="$HOME/.npm-global/bin:$PATH"
 
 export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

 export PATH="$HOME/.npm-global/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
