" trim trailing whitespace ----- {{{
"https://vi.stackexchange.com/a/456
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
	autocmd!
	autocmd BufWritePre * if !&binary && &ft !=# 'mail'
                   \|   call TrimWhitespace()
                   \| endif
augroup END
" }}}
"
augroup REMEMBER_FOLDS
	autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
