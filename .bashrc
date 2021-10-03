# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export TERM=xterm-256color
VISUAL=nvim
EDITOR=nvim
HISTSIZE=1000
HISTFILESIZE=2000
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
#export PS1="\[\033[35m\]\u@\[\033[32m\]\h \[\033[33m\]\w \[\033[91m\]\$(parse_git_branch)\[\033[00m\]$ "
# PROMPT_COMMAND='echo -e "\e[?16;0;200c"'
alias configfiles='git --git-dir="D:\dotfiles\dotfiles" --work-tree="$LOCALAPPDATA"'
################################################################################################################
 export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \w\[\033[0;32m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " - ["; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\[\033[0;32m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "]"; fi)\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\]\[\033[0m\] '
# export PS1="\[\e[0;32m\]\[\e[0m\]\[\e[0;32m\]\u\[\e[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\] $(parse_git_branch)\n\[\033[0;32m\]└─\[\033[0m\]\[\033[0;32m\] \$\[\033[0m\]\[\033[0;32m\] ▶\[\033[0m\] "
#############################################################################
#https://gist.github.com/justintv/168835#gistcomment-2711710

