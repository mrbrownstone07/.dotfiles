function get_host {
	echo $HOST 
}

PROMPT='%{$fg[blue]%}$(get_host)%{$reset_color%}% : $_PATH $_POINT '
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

_PATH="%{$fg[white]%}%~%{$reset_color%}"
_POINT="%{$fg[green]%}➜%{$reset_color%}"

