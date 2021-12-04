vim.cmd( [[

"General Settings
set mouse=a
" CLIPBOARD ----- {{{
"vim clipboard and system clipboard same now
set clipboard^=unnamed
"wrap backspace
set backspace=indent,eol,start
"https://stackoverflow.com/a/53872985/12988588
"dont save character deleted using `x`
"send it to The blackhole-register
nnoremap x "_x
"set autochdir
" }}}

" EDITOR ----- {{{
set termguicolors
syntax on
set conceallevel=0

let g:vimsyn_embed = 'l' " syntax heightlighting for embedded lua
" filetype on
" filetype plugin on
" filetype indent on
set ignorecase
set smartcase
" use 4 spaces for tabs
set tabstop=4
set autoindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set scrolloff=8
set showtabline=2
set lazyredraw
set cursorline
set colorcolumn=80
set signcolumn=yes
" Show white spaces https://gist.github.com/jdavid82/d40f40e6f124aad6223eba0ff0c7ad65#file-vimrc-L37-L39
"set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
"set list
" }}}

" SEARCHING ----- {{{
set incsearch "on by default"
set nohlsearch
" clear last used search pattern:http://vimdoc.sourceforge.net/htmldoc/pattern.html#last-pattern
"
let @/=""
" }}}

" FOLDING ----- {{{
" use pattern {{{ #code# }}} to detect fold region
" use zm to fold all markers and zr to release all folds with markers
set foldmethod=marker
" }}}

" BUFFERS ----- {{{
" remember foldings is nvim/general/augroups.vim
" }}}

" SPLITS ----- {{{
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"}}}

" Nice menu  like when typing `:find *.py` ---{{{
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

" misc----- {{{
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set ttimeoutlen=0
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" }}}

" tabline ---{{{
" " show tabline
" set showtabline=2
" if has('gui_running')
	" set guioptions-=e
" endif
"
"---}}}

"
let g:netrw_cursor=0 " to use userdefined CursorLine and ColorColumn
let g:netrw_winsize=30
let g:netrw_liststyle=3
]]
)
