local lspconfig = require('lspconfig')
local M = {}

M.setup = function (on_attach)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig.cssls.setup{
        capabilities=capabilities,
        cmd = { "vscode-css-language-server.cmd", "--stdio" },
        filetypes = { "css", "scss", "less" },
        on_attach=on_attach,
        --root_dir = root_pattern("package.json", ".git") or bufdir,
        --https://stackoverflow.com/questions/64868071/i-cannot-activate-nvims-built-in-lsps-for-javascript-and-html
        root_dir = function() return vim.loop.cwd() end ,
        settings = {
          css = {
            validate = true
          },
          less = {
            validate = true
          },
          scss = {
            validate = true
          }
        },
        single_file_support = true
    }

end

return M
