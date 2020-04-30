#------------------------------
# Prompt functions
#------------------------------
setup_git_prompt() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    unset git_prompt
    return 0
  fi

  local git_status_dirty git_branch

  if [ "$(git --no-optional-locks status --porcelain)" ]; then
    git_status_dirty='%F{red}*'
  else
    unset git_status_dirty
  fi

  git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
  git_branch="${git_branch#refs/heads/}"

  if [ "${#git_branch}" -ge 24 ]; then
    git_branch="${git_branch:0:21}..."
  fi

  git_branch="${git_branch:-no branch}"
  git_prompt=" %F{blue}[%F{white}${git_branch}${git_status_dirty}%F{blue}]"
}

setup_host_prompt() {
  if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    unset host_prompt
    return 0
  fi

  host_prompt="%F{blue}%m "
}
