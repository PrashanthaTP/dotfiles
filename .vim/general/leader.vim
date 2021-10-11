" Mappings with leader key
" source vim file
nmap <leader>sv :source $MYVIMRC<CR>
nmap <leader>so :e $MYVIMRC<CR>
" nmap <leader>so :vsplit <bar> :e $LOCALAPPDATA/nvim/init.vim<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>b :buffers<CR>

" splits ----- {{{
"nnoremap <leader>w <C-W>w "removed to support vimwiki
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
"
nnoremap <silent> <Leader>r= <C-w>=<CR>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>0 :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" }}}

"nmap <leader>ws :
