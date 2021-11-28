local lspconfig = require("lspconfig")
local M = {}

--[===[
--local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

local clang_format = { formatCommand = 'clang-format -style=LLVM ${INPUT}', formatStdin = true }
local prettier = { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true }
local stylua = { formatCommand = 'stylua -s -', formatStdin = true }
local black = { formatCommand = 'black --quiet -', formatStdin = true }
--]===]
--
local lua_format_cmd = function()
	local buf_name = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
	return FORMATTERS_DIR .. "/stylua -s '" .. buf_name .. "'"
end

local prettier_format_cmd = function(lang)
	local buf_name = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
    local command = "prettier --stdin-filepath "..buf_name
    if lang==nil or string.len(lang)==0 then
        return command
    end
end

local python_formatter = { formatCommand = "python -m autopep8 -", formatStdin = true }
local prettier_formatter = function(lang)
    return { formatCommand = prettier_format_cmd(lang), formatStdin = true }
end
local lua_formatter = { formatCommand = FORMATTERS_DIR .. "/stylua -s -", formatStdin = true }
local languages = {
	css = { prettier_formatter("css") },
	html = { prettier_formatter("html") },
	javascript = { prettier_formatter("") },
	javascriptreact = { prettier_formatter("") },
	json = { prettier_formatter("json") },
	lua = { lua_formatter },
	python = { python_formatter },
	typescript = { prettier_formatter("") },
	typescriptreact = { prettier_formatter("") },
	scss = { prettier_formatter("scss") },
}

M.setup = function(on_attach)
	require("lspconfig").efm.setup({
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"lua",
			"python",
			"typescript",
			"typescriptreact",
			"scss",
		},
		init_options = { documentFormatting = true },
		cmd = { LANGUAGE_SERVERS_DIR .. "/efm-langserver" },
		settings = {
			languages = languages,
		},
		single_file_support = true,
	})
end

return M
