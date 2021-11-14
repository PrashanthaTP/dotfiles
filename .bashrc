#############################################################################
# ┌────────────────────┐
# │       BASHRC       │
# └────────────────────┘
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export TERM=xterm-256color
VISUAL=vim
EDITOR=vim
HISTSIZE=1000
HISTFILESIZE=2000
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
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
#source_if_exists "$HOME/.config/git/minimal.sh"
source_if_exists "$HOME/.config/git/git-prompt1.sh"
#source_if_exists "$HOME/.config/git/minimal_fast_prompt.sh"
#source_if_exists "$HOME/.config/git/powerlevel10k.sh"
#source_if_exists "$HOME/.config/git/custom.sh"
#source_if_exists "$HOME/.config/git/custom2.sh"

    #GIT_PS1_SHOWDIRTYSTATE=true
    #GIT_PS1_SHOWSTASHSTATE=true
    #GIT_PS1_SHOWUPSTREAM="auto"
    #PS1='\t:\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\] \W$ '
#############################################################################
# ┌────────────────────┐
# │      TMUX          │
# └────────────────────┘
#############################################################################
# Not so sure : putting it in seperate script makes detaching from tmux
# session, results normal bash prompt
source_if_exists "$HOME/.config/tmux/scripts/startup.sh"
