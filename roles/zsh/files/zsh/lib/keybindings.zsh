typeset -A key

key=(
  BackSpace "${terminfo[kbs]}"
  Delete    "${terminfo[kdch1]}"
  Down      "${terminfo[kcud1]}"
  End       "${terminfo[kend]}"
  Home      "${terminfo[khome]}"
  Insert    "${terminfo[kich1]}"
  Left      "${terminfo[kcub1]}"
  PageDown  "${terminfo[knp]}"
  PageUp    "${terminfo[kpp]}"
  Right     "${terminfo[kcuf1]}"
  Shift-Tab "${terminfo[kcbt]}"
  Up        "${terminfo[kcuu1]}"
)

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${key[Down]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${key[Down]}" down-line-or-beginning-search
fi
# start typing + [Up-Arrow] - fuzzy find history backward
if [[ -n "${key[Up]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${key[Up]}" up-line-or-beginning-search
fi

# accept suggestion with Shift-Tab
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  [[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" autosuggest-accept
fi

# remove slash from WORDCHARTS to make removing single path components possible
WORDCHARS=${WORDCHARS:s@/@}

bindkey '^ '      autosuggest-accept
bindkey '^U'      backward-kill-line # [Ctrl-U]          - delete line backwards from cursor
bindkey '^H'      backward-kill-word # [Ctrl-Backspace]  - delete word before the cursor
bindkey '^[[1;5D' backward-word      # [Ctrl-LeftArrow]  - move backward one word
bindkey '^[[1;5C' forward-word       # [Ctrl-RightArrow] - move forward one word
bindkey '^[[3;5~' kill-word          # [Ctrl-Delelete]   - delete word after the cursor

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  zle -N zle-line-init zle_application_mode_start
  zle -N zle-line-finish zle_application_mode_stop
fi
