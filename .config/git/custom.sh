git_stats() {
  local STATUS=$(git status -s 2> /dev/null)
  local ADDED=$(echo "$STATUS" | grep '??' | wc -l)
  local DELETED=$(echo "$STATUS" | grep ' D' | wc -l)
  local MODIFIED=$(echo "$STATUS" | grep ' M' | wc -l)
  local STATS=''
  if [ $ADDED != 0 ]; then
    STATS="\e[42m $ADDED "
  fi
  if [ $DELETED != 0 ]; then
    STATS="$STATS\e[101m $DELETED "
  fi
  if [ $MODIFIED != 0 ]; then
    STATS="$STATS\e[30;103m $MODIFIED "
  fi
  echo -e "\e[0m    $STATS\e[0m"
}
__PS1_BEFORE='\n\n'
__PS1_USER='\[\e[97;104m\] \u '
__PS1_LOCATION='\[\e[30;43m\] \w '
__PS1_GIT_BRANCH='\[\e[97;45m\] `__git_ps1` ' __PS1_GIT_STATS='`git_stats` '
__PS1_AFTER='\[\e[0m\]\n\n'

export PS1="${__PS1_BEFORE}${__PS1_USER}${__PS1_LOCATION}${__PS1_GIT_BRANCH}${__PS1_GIT_STATS}${__PS1_AFTER}"
