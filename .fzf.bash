# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix fzf)/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix fzf)/fzf/shell/key-bindings.bash"
