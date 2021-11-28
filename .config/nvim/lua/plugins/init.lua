-- PLUGINS
--https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = function(plugin, ...)
	vim.call("plug#", plugin, ...)
end

vim.call("plug#begin", PLUGINS_DIR)
Plug("sainnhe/gruvbox-material")
Plug("preservim/nerdtree", { on = { "NERDTreeToggle", "NERDTreeFind" } })
--Plug("sbdchd/neoformat")
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
Plug("rafamadriz/friendly-snippets")
Plug("hrsh7th/vim-vsnip")
Plug("hrsh7th/cmp-vsnip")
--Plug 'hrsh7th/vim-vsnip-integ'
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-lualine/lualine.nvim")

Plug("nvim-telescope/telescope.nvim")
vim.call("plug#end")

require("plugins.nerdtree")
require("plugins.nvim-cmp")
require("plugins.nvim-lspconfig")
require("plugins.vim-vsnip")
require("plugins.lualine")
require("plugins.nvim-treesitter")

require("plugins.nvim-telescope")

vim.cmd([[colorscheme gruvbox-material]])
--require('plugins.syntax.gruvbox')

vim.cmd([[
"highlight! LspDiagnosticsVirtualTextHint guifg=#FF0000 ctermfg=Red
highlight! LspDiagnosticsVirtualTextWarning guifg=Red ctermfg=Red
highlight! LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
highlight! LspDiagnosticsDefaultWarning guifg=#FF0000 ctermfg=Red
highlight! LspDiagnosticsDefaultError guifg=#FF0000 ctermfg=Red
]])
