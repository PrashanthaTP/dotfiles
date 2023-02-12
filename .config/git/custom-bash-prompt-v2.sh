#!/bin/env bash

# Git Bash Prompt
# Author  : TPP
# Date    : Jan 01 2023
# License : MIT

# +----------------------------------+
# | Git Related (__git_ps1) settings |
# +----------------------------------+

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWCOLORHINTS=true

export PROMPT_DIRTRIM=4

PROMPT_ENABLE_GLYPHS=true

RESET="$(tput sgr0)"
BOLD=="$(tput bold)"
ITALIC="$(tput sitm)"

VS_BLUE_FG="$(tput setaf 39)"
VS_BLUE_BG="$(tput setab 39)"

VS_YELLOW_FG="$(tput setaf 228)"
VS_YELLOW_BG="$(tput setab 228)"

VS_GREEN_FG="$(tput setaf 40)"
VS_GREEN_BG="$(tput setab 40)"

VS_GREEN_V2_FG="$(tput setaf 48)"
VS_GREEN_V2_BG="$(tput setab 48)"

VS_ORANGE_FG="$(tput setaf 208)"
VS_ORANGE_BG="$(tput setab 208)"

RED_FG="$(tput setaf 9)"
RED_BG="$(tput setab 9)"
GREEN_FG="$(tput setaf 83)"
GREEN_BG="$(tput setab 83)"


color(){
    if [[ "$2" == "2" ]];
    then
        echo -n "\001$1\002"
    else
        echo -n "\[$1\]"
    fi

}
__prompt_is_bare_repo(){
    [[ "$(git rev-parse --is-bare-repository 2>/dev/null )" == "true" ]] && echo "[bare]"
}

__prompt_get_git_branch_v1(){
    local git_string=$(__git_ps1 '(%s)')
    if [[ ! -z ${git_string} ]];
    then
        [[ ! -z ${PROMPT_ENABLE_GLYPHS} ]] && echo " ${git_string}" || echo "${git_string}"
    fi
}

__prompt_get_git_branch_v2(){
    local git_ref_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    local git_commit_short=$(git rev-parse --short HEAD 2>/dev/null)
    local possible_tag_names=($(git tag --points-at HEAD 2>/dev/null))
    local possible_tag_name=
    for tag in "${possible_tag_names[@]}";do
        possible_tag_name="${possible_tag_name}""$(color ${VS_BLUE_FG} 2)["'\033[2;37m'"${tag}"'\033[0m'"$(color ${VS_BLUE_FG} 2)]"'\033[0m'
    done
    if [[ ! -z "${git_ref_name}" || ! -z "${git_commit_short}" ]];
    then
        local git_string="${git_ref_name} $(color ${VS_ORANGE_FG} "2")(${git_commit_short})$(color ${RESET} 2)"
        if [[ (! -z ${possible_tag_name}) && "${git_commit_short}" != "${possible_tag_name}" ]];
        then
            if [[ ! -z ${PROMPT_ENABLE_GLYPHS} ]];
            then
                [ ${#possible_tag_names[@]} -gt 0 ] && git_string+=" ${possible_tag_name} "
            else
                [ ${#possible_tag_names[@]} -gt 0 ] && git_string+=" ${possible_tag_name} "
            fi
        fi
        echo -n ":$(__prompt_is_bare_repo): "
        [[ ! -z ${PROMPT_ENABLE_GLYPHS} ]] && echo -n " " || echo -n " "
        echo -e "${git_string}"
    fi
    
}

__prompt_get_pwd(){
    echo -n "$(pwd)"
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1
__show_py_virtualenv(){
if [[ -n "${VIRTUAL_ENV}" ]];then
    local venv_name=$(color ${VS_BLUE_FG} 2)
    venv_name+="( "
    venv_name+="$(color ${VS_YELLOW_FG} 2)"
    [[ -n "${PROMPT_ENABLE_GLYPHS}" ]] && venv_name+=" "
    venv_name+="$(basename ${VIRTUAL_ENV})"
    venv_name+=$(color ${VS_BLUE_FG} 2)
    venv_name+=" ) "
    echo -en "${venv_name}"
fi

}
PS1="\n"
PS1+="$(color ${VS_BLUE_FG})"
[[ ! -z ${PROMPT_ENABLE_GLYPHS} ]] && PS1+=" "
PS1+="\w"
PS1+="$(color ${RESET})"

PS1+="$(color ${VS_YELLOW_FG}) \$(__prompt_get_git_branch_v2) $(color ${RESET})"
PS1+=$'\n' #important to use $'\n'

# python virtual environment info
#echo $VIRTUAL_ENV

PS1+="\$(__show_py_virtualenv)"
#if [[ -n "${VIRTUAL_ENV}" ]];then
    #PS1+="$(color ${VS_BLUE_FG})"
    #PS1+="("
    #[[ -n "${PROMPT_ENABLE_GLYPHS}" ]] && PS1+="  "
    #PS1+="$(basename ${VIRTUAL_ENV}) )"
#fi

PS1+="\$ $(color ${VS_GREEN_V2_FG})"

