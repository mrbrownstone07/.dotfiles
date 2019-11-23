local resetColor="%{$reset_color%}"

local prefix="%{$fg_bold[white]%}>$resetColor%{$fg_bold[magenta]%}>$resetColor%{$fg_bold[blue]%}>$resetColor"
local dir="%{$fg_bold[blue]%}%c$resetColor$resetColor"
local NEWLINE=$'\n\n'

PROMPT='[$dir] '
RPROMPT='$(git_prompt_info)'

#PROMPT='%{$fg_bold[blue]%}$prefix $(ssh_connection)$dir $(git_prompt_info)'
MODE_INDICATOR="%{$fg_bold[green]%}%{$bg[red]%} NORMAL %{$reset_color%}"

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[white]%}☰ "
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}$resetColor%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$resetColor"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ⨯"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
