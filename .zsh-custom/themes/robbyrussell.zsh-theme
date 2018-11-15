local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

# %c current dir
# %~ pwd
local path_status="%{$fg[cyan]%}%c%{$reset_color%}"

PROMPT='${ret_status} ${path_status} $(git_prompt_info)$(modifyTouchbar)'
