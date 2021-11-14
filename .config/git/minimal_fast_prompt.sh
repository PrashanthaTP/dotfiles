#! /bin/bash
###############################################################################
# Prompt references
# + https://wiki.archlinux.org/title/Bash/Prompt_customization#PROMPT_COMMAND
# + https://web.archive.org/web/20161214154424/https://stackoverflow.com/questions/103857/what-is-your-favorite-bash-prompt

#rightprompt()
#{
    #printf "%*s" $COLUMNS "right prompt"
#}
#
#export PS1='\[$(tput sc; rightprompt; tput rc)\]left prompt > '
###############################################################################
colorize(){
	local temp=$1
	echo "\001${!temp}\002"
}
gitbranch_helper() {
        echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
}
git_branch() {
        gitbranch_helper | sed 's/()//'
}
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

set_colors(){
BOLD=$(tput bold)
RESET=$(tput sgr0)
if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
  BLACK0=$(tput setaf 0)
  BLACK0_BG=$(tput setab 0)
  RED=$(tput setaf 9)
  RED_BG=$(tput setab 9)
  GRAY=$(tput setaf 8)
  GRAY_BG=$(tput setab 8)
  GREEN=$(tput setaf 113)
  GREEN_BG=$(tput setab 113)
  WHITE=$(tput setaf 15)
  WHITE_BG=$(tput setab 15)
  ORANGE=$(tput setaf 208)
  ORANGE_BG=$(tput setab 208)
  GOLD=$(tput setaf 178)
  GOLD_BG=$(tput setab 178)
  GOLD3=$(tput setaf 142)
  GOLD3_BG=$(tput setab 142)
  YELLOW=$(tput setaf 178 )
  YELLOW_BG=$(tput setab 178 )
  Chartreuse3=$(tput setaf 76)
  Chartreuse3_BG=$(tput setab 76)
fi

}
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=

__prompt_command(){

PS1="\n$(colorize GOLD)\u$(colorize RESET)$(colorize GREEN) @ $(colorize GOLD3)\h :: \w$(colorize GOLD) \$(parse_git_branch) $(colorize RESET)"

# if [[ ${#VIRTUAL_ENV} -gt 0 ]]
# then
	# PS1+=$' \uE235 '
	# PS1+="$(basename ${VIRTUAL_ENV}) "
# fi

#PS1+="\n$(colorize GREEN)└─\$ ▶ $(colorize RESET) "
PS1="$PS1"$'\n'"$(colorize GREEN)└─\$ ▶ $(colorize RESET) "
}
PROMPT_COMMAND=__prompt_command

set_colors
unset set_colors
