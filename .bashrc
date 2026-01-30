set_prompt() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n "$branch" ]]; then
    PS1="\[\033[32m\]\t\[\033[0m\] \[\033[33m\]\w\[\033[0m\] \[\033[36m\]($branch)\[\033[0m\]\n$ "
  else
    PS1="\[\033[32m\]\t\[\033[0m\] \[\033[33m\]\w\[\033[0m\]\n$ "
  fi
}
