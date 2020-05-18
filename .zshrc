export GITHUB_TOKEN="add token here"
export GIANTBOMB_TOKEN="add token here"

# Access local X-server with VcXsrv.
# Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
export DISPLAY=:0


alias ls="ls -A1 --color=tty"
alias sudo="sudo "
alias nvim="~/bin/nvim.appimage"

ZSH_THEME="avit"
ZSH_TMUX_AUTOSTART=true

plugins=(
  docker
  git
  npm
  nvm
  tmux
 )  
