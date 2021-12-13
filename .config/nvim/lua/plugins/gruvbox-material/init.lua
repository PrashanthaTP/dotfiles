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
"doautocmd User LoadGruvbox

]])
vim.g.gruvbox_contrast_dark = "medium"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
vim.cmd([[colorscheme gruvbox-material ]])
vim.cmd([[hi! Normal ctermbg=NONE guibg=NONE cterm=NONE gui=NONE]])
-- vim.cmd([[hi! NonText ctermbg=NONE guibg=NONE cterm=NONE gui=NONE]])

-- vim.cmd([[colorscheme gruvbox-material]])
-- require('plugins.syntax.gruvbox')

vim.cmd([[
"highlight! DiagnosticVirtualTextHint guifg=#FF0000 ctermfg=Red
highlight! DiagnosticVirtualTextWarning guifg=Red ctermfg=Red
highlight! DiagnosticVirtualTextError guifg=Red ctermfg=Red
highlight! DiagnosticSignWarn guifg=#FF0000 ctermfg=Red
highlight! DiagnosticSignError guifg=#FF0000 ctermfg=Red
]])
