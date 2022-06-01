ZSH_THEME="avit"

plugins=(
  git
  nvm
  fzf
  # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
  zsh-syntax-highlighting 
 )
 
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ":vcs_info:git:*" formats "%b "

setopt PROMPT_SUBST
PROMPT="%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
$ "

alias sudo="sudo "
alias ls="ls -A1 -G"
 
 export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

 export PATH="$HOME/.npm-global/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
