--https://sbulav.github.io/vim/neovim-telescope-github/
function _G.save_and_exec()
	vim.cmd([[silent! write]])
	if vim.bo.filetype == "lua" then
		require("plenary.reload").reload_module(vim.fn.expand("%"))
		vim.cmd([[:luafile %]])
	elseif vim.bo.filetype == "vim" then
        vim.cmd([[:source %]])
	else
	end

	print("Reloaded buffer : ",vim.fn.expand("%"))
end

vim.cmd([[

let mapleader="\<Space>"

" Mappings with leader key
" source vim file
nmap <leader>vs :source $MYVIMRC<CR>
nmap <leader>vo :e $MYVIMRC<CR>
" nmap <leader>so :vsplit <bar> :e $LOCALAPPDATA/nvim/init.vim<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>b :buffers<CR>
nnoremap <leader>r :call v:lua.save_and_exec()<CR>
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

]])
