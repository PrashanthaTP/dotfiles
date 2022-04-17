#! /bin/bash
SILENT_RUN=0

[ "$1" == "--silent" ] && SILENT_RUN=1
function echo_msg(){
    [ ${SILENT_RUN} -eq 0 ] && echo "$@"
}
echo_msg "Startup script running..."

[[ $(tty) =~ /dev/cons* ]] && echo_msg "Not mintty ; Tmux cannot be launched."

if command -v tmux &> /dev/null \
           && [[ ! $(tty) =~ /dev/cons* ]] \
           && [ -n "$PS1" ] \
           && [[ ! "$TERM" =~ screen ]] \
           && [[ ! "$TERM" =~ tmux ]] \
           && [ -z "$TMUX" ]; then
  #tmux a -t default || exec tmux new -s default && exit;
  #-A : attach to 'default' session if already exists
  #-s : session name
 # tmux new-session -d -s "default";
  #exec tmux new-session -c "$HOME" -A -s default ;
  tmux new-session -c "$HOME" -A -s default ;
fi
