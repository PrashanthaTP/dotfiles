if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1
au BufRead,BufNewFile *.tmux.conf set filetype=tmux
