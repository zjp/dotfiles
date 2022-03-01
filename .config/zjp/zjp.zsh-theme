# A lightly edited version of robyrussel
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`')'
}
PROMPT='$(virtualenv_info) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+='%(?:%{$fg_bold[green]%}Ⲗ :%{$fg_bold[red]%}Ⲗ )%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="↑"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="⇆"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇆"
