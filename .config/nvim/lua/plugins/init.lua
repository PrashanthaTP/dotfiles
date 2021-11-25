-- PLUGINS
--https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = function(plugin, ...)
	vim.call("plug#", plugin, ...)
end

vim.call("plug#begin", PLUGINS_DIR)
Plug("sainnhe/gruvbox-material")
Plug("preservim/nerdtree", { on = { "NERDTreeToggle", "NERDTreeFind" } })
Plug("sbdchd/neoformat")
--[===[  Plug ('prettier/vim-prettier', 
         {  ['do']= 'yarn install', ['for']= {'python',
                                        'lua',
                                        'javascript',
                                         'typescript',
                                         'css',
                                         'scss',
                                         'json',
                                         'markdown',
                                         'html'
                                     }
                                          })
--]===]
Plug("nvim-lua/plenary.nvim")
Plug("neovim/nvim-lspconfig")
--Plug('hrsh7th/nvim-compe') --deprecated
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
--Plug("onsails/lspkind-nvim")--awesome menu styling
Plug("hrsh7th/vim-vsnip")
Plug("hrsh7th/cmp-vsnip")
--Plug 'hrsh7th/vim-vsnip-integ'
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-lualine/lualine.nvim")

vim.call("plug#end")

require("plugins.nerdtree")
require("plugins.nvim-lspconfig")
require("plugins.nvim-cmp")
require("plugins.vim-vsnip")

vim.cmd([[colorscheme gruvbox-material]])
--require('plugins.syntax.gruvbox')

vim.cmd([[
"highlight! LspDiagnosticsVirtualTextHint guifg=#FF0000 ctermfg=Red
highlight! LspDiagnosticsVirtualTextWarning guifg=Red ctermfg=Red
highlight! LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
highlight! LspDiagnosticsDefaultWarning guifg=#FF0000 ctermfg=Red
highlight! LspDiagnosticsDefaultError guifg=#FF0000 ctermfg=Red
]])

vim.cmd([[
" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
]])

vim.cmd([[
"let g:prettier#config#single_quote = 'true'
"let g:prettier#config#trailing_comma = 'all'

let g:neoformat_python_autopep8 = {
            \ 'exe': 'python -m autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1 ,
            \ 'stdin': 1,
            \ 'env': ["DEBUG=1"],
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }

let g:neoformat_enabled_python = ['autopep8']

]])

