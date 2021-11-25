vim.cmd([[
augroup SET_COLORSCHEME
	autocmd!
	autocmd User LoadGruvbox ++nested colorscheme gruvbox-material
augroup end

"call with 
]])
-- use as vim.cmd([[doautocmd User LoadGruvbox ]])
vim.cmd([[
set termguicolors
if exists('+termguicolors')
    let &term="xterm-256color"
    set t_Co=256
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
"let g:gruvbox_contrast_dark = 'hard'
doautocmd User LoadGruvbox

]])
