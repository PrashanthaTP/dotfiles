local nvim_lsp = require("lspconfig")
local utils = require("plugins.nvim-lspconfig.utils")
local on_attach = utils.on_attach

local servers = {
  "pyright", "clangd", "cmake", "tsserver", "cssls", "sumneko_lua"
}
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
--[[
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
--]]
-- vim.lsp.set_log_level("debug")
--------------------------------------------------------------------------------
-- Import servers configurations
--------------------------------------------------------------------------------
require("plugins.nvim-lspconfig.servers.pyright").setup(on_attach, capabilities)
require("plugins.nvim-lspconfig.servers.clangd").setup(on_attach, capabilities)
require("plugins.nvim-lspconfig.servers.cmake").setup(on_attach, capabilities)
require("plugins.nvim-lspconfig.servers.cssls").setup(on_attach, capabilities)
require("plugins.nvim-lspconfig.servers.sumneko_lua").setup(on_attach,
                                                            capabilities)
require("plugins.nvim-lspconfig.servers.tsserver").setup(on_attach, capabilities)
require("plugins.nvim-lspconfig.servers.efm").setup(on_attach, capabilities)
--require("plugins.nvim-lspconfig.servers.diagnosticls").setup(on_attach,capabilities)
--

--------------------------------------------------------------------------------
-- Update location list with LSP Diagnostics
--------------------------------------------------------------------------------
---reference : https://rafaelleru.github.io/blog/quickfix-autocomands/
--- reference for autocmd : https://github.com/neovim/neovim/issues/14090#issuecomment-979424077
function _G.updateLocationList() vim.diagnostic.setloclist({open = false}) end

vim.cmd([[
    augroup UPDATE_LOCATION_LIST_WITH_LSP_LINTS
    autocmd!
    autocmd! DiagnosticChanged * :call v:lua.updateLocationList()
	"autocmd! DiagnosticChanged * lua vim.diagnostic.setqflist({open = false })
    augroup END
]])

--------------------------------------------------------------------------------
-- Highlight groups for LSP virtual texts
-- Nvim 0.6.0 and up
--------------------------------------------------------------------------------
vim.cmd([[
"highlight! DiagnosticVirtualTextHint guifg=#FF0000 ctermfg=Red
highlight! DiagnosticVirtualTextWarning guifg=Red ctermfg=Red
highlight! DiagnosticVirtualTextError guifg=Red ctermfg=Red
]])
