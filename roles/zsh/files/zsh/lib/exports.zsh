if command -v qutebrowser >/dev/null 2>&1; then
    export BROWSER="qutebrowser"
fi

if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim" VISUAL="nvim"
else
    export EDITOR="vim" VISUAL="vim"
fi
