local prettierFormatterOptions = {
    exe = "prettier",
    args = {
        "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
    },
    stdin = true
}

local prettierdFormatterOptions = {
    exe = "prettierd",
    args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
}
local prettierdSlimFormatterOptions = {
    exe = "prettier_d_slim",
    args = {
        "--stdin", "--stdin-filepath",
        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
    },
    stdin = true
}
local cssFormatterOptions = {
    exe = "prettierd",
    args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
}
local luaFormatterOptions = {
    exe = FORMATTERS_DIR .. "/lua-format.exe",
    args = {"-i"},
    stdin = true
}
local pythonFormatterOptions = {
    exe = "python -m autopep8",
    args = {"-"},
    stdin = true
}
local cFormatterOptions = { -- clang-format
    exe = "clang-format",
    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
    stdin = true,
    cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
}

local langFormatters = {
    c = cFormatterOptions,
    cpp = cFormatterOptions,
    css = prettierFormatterOptions,
    html = prettierFormatterOptions,
    javascript = prettierdFormatterOptions,
    javascriptreact = prettierdFormatterOptions,
    json = prettierdFormatterOptions,
    lua = luaFormatterOptions,
    python = pythonFormatterOptions,
    scss = prettierdFormatterOptions,
    typescript = prettierdFormatterOptions,
    typescriptreact = prettierdFormatterOptions
}
local formatterModule = require('formatter')
local filetypeFormatterMap = {}
for lang, langFormatter in pairs(langFormatters) do
    filetypeFormatterMap[lang] = {function() return langFormatter end}
end
formatterModule.setup({filetype = filetypeFormatterMap})
--[===[
require('formatter').setup({
    filetype = {
        c = {function() return cFormatterOptions end},
        cpp = {function() return cFormatterOptions end},
        css = {function() return prettierFormatterOptions end},
        html = {function() return prettierFormatterOptions end},
        javascript = {function() return prettierFormatterOptions end},
        javascriptreact = {function() return prettierFormatterOptions end},
        json = {function() return prettierFormatterOptions end},
        lua = {function() return luaFormatterOptions end},
        python = {function() return pythonFormatterOptions end},
        scss = {function() return prettierFormatterOptions end},
        typescript = {function() return prettierFormatterOptions end},
        typescriptreact = {function() return prettierFormatterOptions end}
    }
})

--]===]

local formatters = require('formatter.config').values.filetype

local logPrefix = "[formatter]: "
local log = function(logMsg) print(logPrefix .. logMsg) end

function _G.customFormatCmd(opts)
    opts = opts or {}
    local doWriteAfterFormatting = opts.doWriteAfterFormatting or 1
    if (doWriteAfterFormatting == 1) then
        vim.cmd("FormatWrite")
    else
        vim.cmd("Format")
    end
    local filetype = vim.bo.filetype
    if (formatters[filetype] == nil) then do return end end
    log("formatting using " .. langFormatters[filetype].exe)
    log("formatting done.")
    vim.cmd("redraw")

end

vim.api.nvim_exec([[
nnoremap <leader>wf :call v:lua.customFormatCmd({'doWriteAfterFormatting':1})<CR>
xnoremap <leader>wf :call v:lua.customFormatCmd({'doWriteAfterFormatting':0})<CR>
augroup FormatAutogroup
  autocmd!
  "autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.css,*.scss,*.py,*.lua :call v:lua.customFormatCmd({'doWriteAfterFormatting':1})
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.css,*.scss,*.py,*.lua  call v:lua.customFormatCmd({'doWriteAfterFormatting':1})
augroup END
]], true)
