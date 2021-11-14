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
"https://github.com/microsoft/terminal/issues/4335
"
" https//vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
"
augroup CURSOR_MANAGEMENT
	autocmd!

" powershell requires different format for escape codes
" see :
" (i) https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-5.1#example-6--use-vimodechangehandler-to-display-vi-mode-changes
" (ii) https://github.com/microsoft/terminal/issues/1604
if has('win32')
	"https://github.com/neovim/neovim/issues/4867#issuecomment-291249173"
	autocmd VimEnter * silent !echo  -ne "\1\e[6 q\2"
	autocmd VimLeave * set guicursor=a:ver25

else
	autocmd VimEnter * silent !echo  -ne "\e[2 q"
	autocmd VimLeave * silent !echo -ne  "\e[6 q"
" autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"
" autocmd VimLeave * let &t_SI.="\<Esc>[6 q"
endif
augroup END
" }}
