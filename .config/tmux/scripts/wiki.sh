#!/bin/sh

# Script to open Vimwiki dir in tmux popup

# exit if tmux not running
# -z checks if len of string is zero
# $TMX variable is automatically set if tmux server is running
[ -z "$TMUX" ] && exit 1

SESSION="wiki"

if [ "$(tmux display-message -p -F "#{session_name}")" = "${SESSION}" ];then
    echo "Detaching from ${SESSION}"
    tmux detach-client # detach if already in the popup
    tmux display-message "detached from session:${SESSION}"
    exit 1
fi

WINDOW="vimwiki"
SESSION_EXISTS=0

WIKI_INDEX_FILE="/d/dotfiles/wiki/vimwiki/index.md"

open_wiki(){
 echo "Creating wiki session..."
# create a session if doesn't exist in a detached state
 tmux new-session -d -s "${SESSION}" \;\
      rename-window -t "${SESSION}:0" "${WINDOW}" \;\
      split-window -t "${SESSION}:${WINDOW}.0" -h \;\
      send-keys -t ${SESSION}:${WINDOW}.0 "vi ${WIKI_INDEX_FILE}" ENTER \;\
       send-keys -t ${SESSION}:${WINDOW}.1 "cd \$(dirname ${WIKI_INDEX_FILE});clear" ENTER \;\
      select-pane -t "${SESSION}:${WINDOW}.0" \;
}

tmux has-session -t "${SESSION}" &> /dev/null
[ $? == 0 ] && SESSION_EXISTS=1
[ ${SESSION_EXISTS} == 0 ] && open_wiki
echo "Attaching to session 'wiki'"
tmux display-message "Attaching to session:${SESSION}"
tmux display-popup -E -h "80%" -w "80%" "tmux attach -t ${SESSION}"

#tmux display-popup -E -h "80%" -w "80%" "tmux new-session -A -s ${SESSION} \;\
                        #rename-window -t 0 \"${WINDOW}\" \;\
                        #split-window -h \;\
                        #select-pane -t 0 \;\
                       #send-keys -t ${SESSION}.0 \"${VI_CMD}\" ENTER"

