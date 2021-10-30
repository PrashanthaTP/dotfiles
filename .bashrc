#############################################################################
# ┌────────────────────┐
# │       BASHRC       │
# └────────────────────┘
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#export TERM=xterm-256color
VISUAL=vim
EDITOR=vim
HISTSIZE=1000
HISTFILESIZE=2000

#############################################################################
# ┌─────────────────────────────┐
# │     ALIASES & FUNCTIONS     │
# └─────────────────────────────┘
# must be sourced first
#############################################################################
source "$HOME/.config/bash/.bash_aliases"
source "$HOME/.config/bash/.bash_functions"

#############################################################################
# ┌────────────────────┐
# │       ZSH          │
# └────────────────────┘
# https://gist.github.com/fworks/af4c896c9de47d827d4caa6fd7154b6b
#############################################################################
# Launch Zsh
#if [ -t 1 ]; then
#exec zsh-5.8
#fi

#############################################################################
# ┌────────────────────┐
# │       PROMPT       │
# └────────────────────┘
# ref : https://gist.github.com/justintv/168835#gistcomment-2711710
#############################################################################
source_if_exists "$HOME/.config/git/git-prompt.sh"

#############################################################################
# ┌────────────────────┐
# │      TMUX          │
# └────────────────────┘
#############################################################################
# Not so sure : putting it in seperate script makes detaching from tmux
# session, results normal bash prompt
source_if_exists "$HOME/.config/tmux/startup.sh"
