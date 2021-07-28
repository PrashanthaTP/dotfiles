"General Settings
" CLIPBOARD ----- {{{
"vim clipboard and system clipboard same now
set clipboard^=unnamed 
" }}}

" MODES ----- {{{
"use jk in insert mode to switch to normal mode
imap jk <ESC> 
" }}}

" EDITOR ----- {{{
syntax on
set number relativenumber
" }}}

" SEARCHING ----- {{{
set nohlsearch
" clear last used search pattern:http://vimdoc.sourceforge.net/htmldoc/pattern.html#last-pattern
let @/="" 
" }}}

" FOLDING ----- {{{
" use pattern {{{ #code# }}} to detect fold region
" use zm to fold all markers and zr to release all folds with markers
set foldmethod=marker
" }}}

" BUFFERS ----- {{{
" remember foldings
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" }}}

" SPLITS ----- {{{
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"}}}

" wildmenu ----- {{{
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" }}}
