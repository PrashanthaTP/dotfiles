#! /bin/sh
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#export PS1='\n\[\e[0;32m\]\[\e[0m\]\[\e[0;32m\]\u\[\e[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\] $(parse_git_branch)'$'\n\[\033[0;32m\]└─\[\033[0m\]\[\033[0;32m\] \$\[\033[0m\]\[\033[0;32m\] ▶\[\033[0m\] '
#┌─╭─

#export PS1='\n\[\e[0;32m\]\[\e[0m\]\[\e[0;32m\]╭─ \u\[\e[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\] $(parse_git_branch)'$'\n\[\033[0;32m\]╰─▶\[\033[0m\]\[\033[0;32m\] » $ \[\033[0m\]\[\033[0;32m\] \[\033[0m\] \[$(tput setaf 118)\]'
#
function __git_ps1_fast() {
# ref : https://gist.github.com/urbanautomaton/5206496
  local dir="$PWD"
  local git_dir

  until [[ -z "$dir" ]]; do
    git_dir="$dir/.git"
    if [[ -d "$git_dir" ]]; then
      echo " (`git rev-parse --abbrev-ref HEAD`)"
      return
    fi

    dir="${dir%/*}"
  done
}
export GIT_PS1_SHOWDIRTYSTATE=
export GIT_PS1_SHOWUNTRACKEDFILES=
export PS1='\n\[\e[0;36m\]╭─ \u @\h ::\w `__git_ps1_fast`'$'\n''\[\e[0;36m\]╰─▶$ \[\033[0m\]\[\e[0;32m\]'
#export PS1='\u @\h\n╰─▶ » $ \[$(tput setaf 118)\]'
