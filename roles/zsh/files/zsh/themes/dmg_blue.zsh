#------------------------------
# Fzf theme
#------------------------------
export FZF_DEFAULT_OPTS='
  --color bg:-1,bg+:4,fg:7,fg+:7,hl:1,hl+:0
  --color border:4,gutter:-1,info:2,marker:2,pointer:7,prompt:4,spinner:7'

#------------------------------
# Hooks
#------------------------------
precmd() {
  setup_git_prompt
  setup_host_prompt
}

#------------------------------
# Prompt
#------------------------------
setopt promptsubst # turn on command substitution in the prompt

PROMPT='%B${host_prompt}%(?..%F{red}[%F{white}%?%F{red}] )%F{blue}%1~${git_prompt} %F{cyan}%# %b%f%k'
