require("utils.globalfunctions")

vim.cmd([[
" QuickFixList -----{{{
    nnoremap <C-k> :cprev<CR>
    nnoremap <C-j> :cnext<CR>
    nnoremap <C-q> :copen<CR>
"}}}

" locationlist -----{{{
    nnoremap <leader>k :call v:lua.navigateLocationList('prev')<CR>
    nnoremap <leader>j :call v:lua.navigateLocationList('next')<CR>
    nnoremap <leader>q :lopen<CR>
"}}}
]])
