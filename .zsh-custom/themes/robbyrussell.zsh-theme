local RET_STATUS="%(?:%{$fg_bold[green]%}▸:%{$fg_bold[red]%}▸)"

# %c current dir
# %~ pwd
local PATH_STATUS="%{$fg[cyan]%}%c%{$reset_color%}"

PROMPT='${RET_STATUS}${PATH_STATUS}$(dynamicPrompt)≫ '
