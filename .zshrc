#!/bin/bash

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Reference: https://medium.com/the-code-review/make-your-terminal-more-colourful-and-productive-with-iterm2-and-zsh-11b91607b98c
POWERLEVEL9K_MODE='nerdfont-complete'

# newline
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right

# vcs
# Reference: https://github.com/bhilburn/powerlevel9k#vcs-symbols
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=3

# command_execution_time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

#Custom command: Kube context
function kube_context() {
  KUBE_CONTEXT="$(kubectl config current-context)"
  KUBE_NAMESPACE="$(kubectl config get-contexts --no-headers | grep '*' | awk '{print $5}')"
  echo "${KUBE_CONTEXT}/${KUBE_NAMESPACE}"
}
POWERLEVEL9K_CUSTOM_KUBE_CONTEXT="kube_context"
POWERLEVEL9K_CUSTOM_KUBE_CONTEXT_BACKGROUND="navyblue"
POWERLEVEL9K_CUSTOM_KUBE_CONTEXT_FOREGROUND="darkblue1"

# Elements: anaconda aws aws_eb_env background_jobs newline disk_usage battery public_ip context user host custom command_execution_time dir docker_machine go_version history detect_virt icons_test ip vpn_ip laravel_version load node_version nvm nodeenv os_icon php_version ram rbenv chruby root_indicator rust_version rspec_stats rvm ssh status swap symfony2_tests symfony2_version time date todo vcs vi_mode virtualenv pyenv openfoam swift_version dir_writable kubecontext dropbox java_version powerlevel9k_setup powerlevel9k_teardown powerlevel9k_setup
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time custom_kube_context vcs time ram)

# Backup 2019-08
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir custom_kube_context vcs openfoam newline status)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time time public_ip history ram)

# Change the prompt behaviour when recording with asciinema
# To get a clean prompt manually run `ASCIINEMA_REC=1 reload`
if [[ -n $ASCIINEMA_REC ]]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
fi

source /opt/codebase/others/powerlevel9k/powerlevel9k.zsh-theme

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  poetry
  docker
  docker-compose
  # zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{init,exports,path,alias,completion,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
