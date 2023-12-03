ZSH_THEME="avit"

plugins=(
  git
  nvm
  fzf
 )
 
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ":vcs_info:git:*" formats "%b "

setopt PROMPT_SUBST
PROMPT="%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
$ "

alias sudo="sudo "
alias ls="exa --long --no-permissions --no-user"
 
 export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

 export PATH="$HOME/.npm-global/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
