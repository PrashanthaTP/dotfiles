vim.cmd([[
" MODES ----- {{{
"use jk in insert mode to switch to normal mode
inoremap jk <ESC>
" }}}

" yanking  ----- {{{
"to match the behaviour of 'C' and 'D'
nnoremap Y y$
"replace with yanked word
"https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
nnoremap S "_diwP
vnoremap S "_d"0P
"highlight the yanked area for an extened period
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END
" }}}

" searching : the primeagen : top 5 keybindings ----- {{{
"put the cursor at screen center while going to next search result
nnoremap n nzz
nnoremap N Nzz

" }}}
"
" breakpoints ----- {{{
"puts the next line at the end of current line : mz = create a mark called z , do J, `z = goto mark z
nnoremap J mzJ`z
"undo breakpoints
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
" }}}
"
" moving lines with ALT key ----- {{{
"https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

"htmlhttps://stackoverflow.com/questions/130734/how-can-one-close-html-tags-in-vim-quickly
"inoremap ><Space> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>

" better indentation ----- {{{
vnoremap > >gv
vnoremap < <gv
" }}}

]]
)
