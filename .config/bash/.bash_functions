#!/bin/bash

source_if_exists(){
	[ -f "$1" ] && source "$1" $2
}

execute_if_exists(){
	[ -f "$1" ] && echo "executing .. $1" && bash "$1"
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gb() {
  is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
   fzy | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

cdc(){
    # vim into config files
    local selected="$(ls ~/.config/**/*.sh | echo -e "$(cat -)\n$HOME/.config/bash/.bash_functions\n$HOME/.config/bash/.bash_aliases" | fzy)"
    [[ ! -z "$selected" ]] && vim "$selected"
}
cprompt(){
    # change bash prompt
    local selected="$(ls ~/.config/git/*prompt*.sh | fzy)"
    echo $selected
}

