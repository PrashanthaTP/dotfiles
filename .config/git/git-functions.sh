#!/bin/env bash

gcd(){
    local target_dir="$(git rev-parse --show-toplevel)"
    echo "Changing diretory to ${target_dir}"
    cd "${target_dir}"
}

Gcd(){
    # works in submodules
    local target_dir="$(git rev-parse --show-superproject-working-tree)"
    echo "Changing diretory to ${target_dir}"
    cd "${target_dir}"
}

gs(){
    git status
}

gsu(){
    git status -uno
}

gc(){
    git commit
}

__gf(){
    git status | grep -E "modified:" | sed -E "s/(^\s*|\s*$|modified\s?*:\s?*)//g"
}

gfadd(){
    __gf | fzy | xargs -I{} git add {}
}

gfdiff(){
    __gf | fzy | xargs -I{} git diff {}
}


cdg(){
    local regex="(-h|--help)" 
    if [[ "$1" =~ $regex ]];then
        echo "cdg"
        echo "---"
        echo -e "Bash function to change directory to the git root directory"
    fi
    local git_root="$(git rev-parse --show-toplevel)"
    if [[ -n "$git_root" ]] ;then
        echo "Changing directory : Jumping to Git Repo Root : ${git_root}"
        cd "$git_root"
    fi

}

