"""
"Auto Commands
"""
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

" persistent folding state --- {{{
augroup REMEMBER_FOLDS
	autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
" --- }}}

" Cursor management --- {{{
augroup CURSOR_MANAGEMENT
	autocmd!
	autocmd VimEnter * silent !echo  -ne "\e[2 q"
	autocmd VimLeave * silent !echo -ne  "\e[6 q"
" autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"
" autocmd VimLeave * let &t_SI.="\<Esc>[6 q"
augroup END
" }}
