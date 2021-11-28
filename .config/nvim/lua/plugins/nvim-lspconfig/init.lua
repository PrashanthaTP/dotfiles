local nvim_lsp = require("lspconfig")
local utils = require("plugins.nvim-lspconfig.utils")
local on_attach = utils.on_attach

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "clangd", "cmake", "tsserver", "cssls", "sumneko_lua" }

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
vim.lsp.set_log_level("debug")
require("plugins.nvim-lspconfig.servers.cssls").setup(on_attach,capabilities)
require("plugins.nvim-lspconfig.servers.sumneko_lua").setup(on_attach,capabilities)
--require("plugins.nvim-lspconfig.servers.efm").setup(on_attach,capabilities)
require("plugins.nvim-lspconfig.servers.diagnosticls").setup(on_attach,capabilities)
require("plugins.nvim-lspconfig.servers.tsserver").setup(on_attach,capabilities)
