autoload -Uz compinit
compinit -d $ZSH/zcompdump

setopt auto_menu                   # show completion menu on successive tab press

zstyle ':completion:*' menu select # select completions with arrow keys
# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
