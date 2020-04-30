alias ..="cd .."
alias grep="grep --color=auto"
alias history="history 0"           # Show the whole history
alias ls="ls --color=auto"
alias sudo="sudo "                  # Pass aliases to root

if command -v nvim >/dev/null 2>&1; then
  alias vim="nvim"
fi

if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
  alias ssh="TERM=xterm-256color ssh"
fi
