#!/bin/bash

# Add tab completion for many Bash commands

# Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
# 	complete -o default -o nospace -F _git g;
# fi;

# # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# # Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ "${commands[kubectl]}" ] && source <(kubectl completion zsh)

# Revert ugly sed after help upgrade: https://github.com/helm/helm/issues/5046
[ "${commands[helm]}" ] && source <(helm completion zsh | sed -E 's/\["(.+)"\]/\[\1\]/g')