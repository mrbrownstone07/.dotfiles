SEGMENT_SEPARATOR=''
SEGMENT_SEPARATOR_RIGHT=$'\ue0b2'
SEGMENT_SEPARATOR_LEFT=$'\ue0b0'

local resetColor="%{$reset_color%}"

#local prefix="➜"
local dir="%{$fg_bold[white]%}%{$bg[black]%} %c $resetColor"
local NEWLINE=$'\n\n'

PROMPT='$dir%{$fg[black]%}$SEGMENT_SEPARATOR_LEFT '
RPROMPT='$(git_prompt_info)'

#PROMPT='%{$fg_bold[blue]%}$prefix $(ssh_connection)$dir $(git_prompt_info)'
MODE_INDICATOR="%{$fg_bold[green]%}%{$bg[red]%} NORMAL %{$reset_color%}"

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[white]%}☰ "
  fi
}
#%{$fg[red]%}$resetColor
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}$SEGMENT_SEPARATOR_RIGHT%{$bg[yellow]%}%{$fg[black]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$resetColor"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ⨯"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
