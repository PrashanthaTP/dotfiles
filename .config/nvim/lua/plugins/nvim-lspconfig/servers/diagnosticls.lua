-- EFM Language Server
--https://phelipetls.github.io/posts/configuring-eslint-to-work-with-neovim-lsp/

local nvim_lsp = require("lspconfig")
local M = {}

M.setup = function(on_attach, capabilities)
	nvim_lsp.diagnosticls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "diagnostic-languageserver.cmd", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"json",
			"typescript",
			"typescriptreact",
			"css",
			"less",
			"scss",
			"markdown",
			"python",
			"pandoc",
		},
		single_file_support = true,
		init_options = {
			linters = {
				eslint = {
					command = "eslint_d",
					rootPatterns = { ".git", "jsconfig.json", "tsconfig.json", "package.json" },
					debounce = 100,
					args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
					sourceName = "eslint_d",
					parseJson = {
						errorsRoot = "[0].messages",
						line = "line",
						column = "column",
						endLine = "endLine",
						endColumn = "endColumn",
						message = "[eslint] ${message} [${ruleId}]",
						security = "severity",
					},
					securities = {
						[2] = "error",
						[1] = "warning",
					},
				},
			},
			filetypes = {
				javascript = "eslint",
				javascriptreact = "eslint",
				typescript = "eslint",
				typescriptreact = "eslint",
			},
			formatters = {
				eslint_d = {
					command = "eslint_d",
					args = { "--stdin", "--fix-to-stdout", "--stdin-filename", "%filename" },
					rootPatterns = { ".git", "jsconfig.json", "tsconfig.json", "package.json" },
				},
				prettier = {
					command = "prettier",
					args = { "--stdin", "--stdin-filepath", "%filename" },
				},
				prettier_lua = {
					command = FORMATTERS_DIR .. "/stylua",
					args = { "-s", "-" },
				},
				prettierd = {
					command = "prettierd",
					args = { "%filename" },
				},
				prettier_python = {
					command = "python -m autopep8",
					args = { "%filename" },
				},
			},
			formatFiletypes = {
				css = "prettier",
				javascript = "prettierd",
				javascriptreact = "prettierd",
				json = "prettier",
				less = "prettier",
				markdown = "prettier",
				python = "prettier_python",
				scss = "prettier",
				typescript = "prettierd",
				typescriptreact = "prettierd",
			},
		},
	})
end

return M
