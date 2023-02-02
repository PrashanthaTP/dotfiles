#!/bin/bash

# Icons
# - OS        : 
# - Folder    : 
# - Git branch: 
# - Arrow     :  
# - Seperator : 


colorize(){
    echo "\001$1\002"
}

BOLD=$(colorize $(tput bold))
RESET=$(colorize $(tput sgr0))

BLACK_FG=$(colorize $(tput setaf 235))
BLACK_BG=$(colorize $(tput setab 235))

YELLOW_FG=$(colorize $(tput setaf 172))
YELLOW_BG=$(colorize $(tput setab 172))

BLUE_FG=$(colorize $(tput setaf 69))
BLUE_BG=$(colorize $(tput setab 69))

VIRTUAL_ENV_DISABLE_PROMPT=1 # see Scripts/activate in a virtutalenvironment
__check_for_virtualenv(){
if [ -n "${VIRTUAL_ENV}" ]; then
    echo -e "${BLACK_BG}[  $(basename ${VIRTUAL_ENV}) ]${RESET}" 
fi
}
PS1=
PS1="\n"
PS1+="${BLUE_FG}${BLUE_BG}${BLACK_FG}${RESET}"
PS1+="${YELLOW_BG}${BLUE_FG}${RESET}"
PS1+="${YELLOW_BG}${BLACK_FG}  \w ${RESET}"
PS1+="${BLUE_BG}${YELLOW_FG}"
PS1+="${BLUE_BG}${BLACK_FG}${BOLD}"
PS1+='$(__git_ps1 "  %s ")'"${RESET}"
#[ -z ${VIRTUAL_ENV} ] && 
PS1+="\$(__check_for_virtualenv)"
PS1+="${BLUE_FG}${RESET}"
PS1+=$'\n'
PS1+="${YELLOW_FG} ${RESET}"

__after_prompt(){
#tput sgr0;
#echo -en "\E[0m"
echo -n ""
}
PROMPT_DIRTRIM=4
trap "__after_prompt" DEBUG

unset -f colorize

unset BOLD
unset RESET
unset BLACK_FG
unset BLACK_BG
unset YELLOW_FG
unset YELLOW_BG
unset BLUE_FG
unset BLUE_BG
