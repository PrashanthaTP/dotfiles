parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#export PS1='\n\[\e[0;32m\]\[\e[0m\]\[\e[0;32m\]\u\[\e[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\] $(parse_git_branch)'$'\n\[\033[0;32m\]└─\[\033[0m\]\[\033[0;32m\] \$\[\033[0m\]\[\033[0;32m\] ▶\[\033[0m\] '
#┌─╭─
export PS1='\n\[\e[0;32m\]\[\e[0m\]\[\e[0;32m\]╭─ \u\[\e[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\] $(parse_git_branch)'$'\n\[\033[0;32m\]╰─▶\[\033[0m\]\[\033[0;32m\] » $ \[\033[0m\]\[\033[0;32m\] \[\033[0m\] \[$(tput setaf 118)\]'

