if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " au! commands to set the filetype go here
  "
  au BufRead,BufNewFile .bash_* set filetype=sh
augroup END
