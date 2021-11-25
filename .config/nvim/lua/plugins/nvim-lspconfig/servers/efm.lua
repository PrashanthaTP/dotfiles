local lspconfig = require('lspconfig')
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
    return LUA_LANG_SERVER_EXE.." -i '"..buf_name.."'"
end

local python_formatter = {formatCommand = "python -m autopep8 -", formatStdin = true}

local lua_formatter = {formatCommand = FORMATTERS_DIR.."/stylua -s -", formatStdin = true }
local languages = { python={python_formatter}, lua={lua_formatter} }

M.setup = function (on_attach)

require "lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    cmd ={LANGUAGE_SERVERS_DIR .."/efm-langserver"},
    settings = {
        languages = languages
    },
        single_file_support = true
}

end

return M
