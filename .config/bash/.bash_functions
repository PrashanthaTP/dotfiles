source_if_exists(){
	[ -f "$1" ] && source "$1"
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

bind '"\er": redraw-current-line'
bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
