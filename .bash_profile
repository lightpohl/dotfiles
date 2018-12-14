alias ~='cd ~';
alias ..='cd ..';
alias ...='cd ../..';
alias ....='cd ../../..';
alias ll='ls -la';

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

lgreen='\[\033[92m\]'
lcyan='\[\033[96m\]'
reset='\[\033[0m\]'
export PS1='\n'$lcyan'\w'$reset''$lgreen'$(parse_git_branch)'$reset''$'\n\$ '

export PATH="/usr/local/bin:$PATH"
