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
--
local lua_format_cmd = function()
  local buf_name = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
  return FORMATTERS_DIR .. "/stylua -s '" .. buf_name .. "'"
end

local prettier_format_cmd = function(lang)
  local buf_name = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
  local command = "prettier --stdin-filepath " .. buf_name
  if lang == nil or string.len(lang) == 0 then
    return command
  end
end

local python_formatter = { formatCommand = "python -m autopep8 --indent-size=4 -", formatStdin = true }
--[===[
--local prettier_formatter = function(lang)
	return { formatCommand = prettier_format_cmd(lang), formatStdin = true }
end
--]===]
--
local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

local eslint_formatter = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}
local prettier_formatter = {
  formatCommand = "prettierd ${INPUT}",
  formatStdin = true,
  --rootPatterns = { ".git", "jsconfig.json", "tsconfig.json", "package.json" },
}
local lua_formatter = { formatCommand = FORMATTERS_DIR .. "/stylua -s -", formatStdin = true }

local languages = {
  css = { prettier_formatter },
  html = { prettier_formatter },
  javascript = { prettier_formatter },
  javascriptreact = { prettier_formatter },
  json = { prettier_formatter },
  lua = { lua_formatter },
  python = { python_formatter },
  typescript = { prettier_formatter },
  typescriptreact = { prettier_formatter, eslint_formatter },
  scss = { prettier_formatter },
}

M.setup = function(on_attach)
  require("lspconfig").efm.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = true
      client.resolved_capabilities.goto_definition = false
      on_attach(client, bufnr)
    end,
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
    --[===[
		root_dir = function()
			if not eslint_config_exists() then
				return nil
			end
			return vim.fn.getcwd()
		end,
        --]===]
    root_dir = lspconfig.util.root_pattern(".git", "package.json", ".stylua.toml", ".pep8") or vim.loop.cwd(),
    --root_dir = vim.loop.cwd,
    single_file_support = true,
  })
end

return M
