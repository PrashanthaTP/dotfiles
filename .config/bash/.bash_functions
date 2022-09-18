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
    local selected="$(ls ~/.config/**/*.sh \
                     | echo -e "$(cat -)\n$HOME/.config/bash/.bash_functions\n$HOME/.config/bash/.bash_aliases\n$HOME/.bashrc\n$HOME/.bash_profile\n$HOME/.inputrc" | fzy)"
    if [[ ! -z "$selected" ]];then
        [[ -x "$(which nvim)" ]] && nvim "$selected" || vim "$selected"
    fi
}
cprompt(){
    # change bash prompt
    local selected="$(ls ~/.config/git/*prompt*.sh | fzy)"
    echo $selected
}

command_not_found_handle(){
    local filename="$1"
    if [[ -f "$HOME/.config/scripts/${filename}.sh" ]] ;then
        shift
        echo "Running $HOME/.config/scripts/${filename}.sh"
        "$HOME/.config/scripts/${filename}.sh"  "$@"
    fi
    echo "bash: $1: command not found"
    return 127

}
srcf(){
    # Source selected file
    # Useful to load a single file 
    # instead of sourcing whole bashrc
    local selected="$(ls ~/.config/**/*.sh \
                     | echo -e "$(cat -)\n$HOME/.config/bash/.bash_functions\n$HOME/.config/bash/.bash_aliases\n$HOME/.bashrc\n$HOME/.bash_profile\n$HOME/.inputrc" | fzy)"
    if [[  -z "$selected" ]];then
        return 0
    fi
    local start_time=$(date +"%s")
    . "${selected}"
    echo -e "\e[2;34mReloaded $selected\e[0m"
    echo -e "\e[2;33mTook $(($(date +"%s")-start_time)) second(s)\e[0m"
}


learn(){
    local selected=$(ls -d /d/Studies/Programming/Learn* | fzy)
    echo "Changing Directory to $selected"
    cd "$selected"
}
