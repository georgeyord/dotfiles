# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix fzf)/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix fzf)/shell/key-bindings.zsh"
