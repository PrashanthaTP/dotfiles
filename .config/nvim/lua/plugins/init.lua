-- PLUGINS
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = function(plugin, ...) vim.call("plug#", plugin, ...) end

vim.call("plug#begin", PLUGINS_DIR)
-- Plug("sainnhe/gruvbox-material")
-- Plug("altercation/vim-colors-solarized")
Plug("romainl/flattened")
-- Plug("lifepillar/vim-solarized8")
Plug("preservim/nerdtree", {on = {"NERDTreeToggle", "NERDTreeFind"}})
-- Plug("sbdchd/neoformat")
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
-- Plug('hrsh7th/nvim-compe') --deprecated
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
-- Plug("onsails/lspkind-nvim")--awesome menu styling
Plug("rafamadriz/friendly-snippets")
Plug("hrsh7th/vim-vsnip")
Plug("hrsh7th/cmp-vsnip")
-- Plug 'hrsh7th/vim-vsnip-integ'
Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("kyazdani42/nvim-web-devicons") -- load at the end : for lua plugins
Plug("ryanoasis/vim-devicons") -- for vim plugins

vim.call("plug#end")

require("plugins.nerdtree")
require("plugins.nvim-cmp")
require("plugins.nvim-lspconfig")
require("plugins.vim-vsnip")
-- require("lualine").setup({ options = { theme = "wombat" } })
require("plugins.lualine")
require("plugins.nvim-treesitter")
require("plugins.nvim-telescope")
-- require("plugins.gruvbox-material")
-- require("plugins.vim-colors-solarized")
require("plugins.flattened")
