local lspconfig = require("lspconfig")
local M = {}

M.setup = function(on_attach, capabilities)
  local _capabilities = nil
  if capabilities == nil then
    _capabilities = vim.lsp.protocol.make_client_capabilities()
    _capabilities.textDocument.completion.completionItem.snippetSupport = true
  else
    _capabilities = capabilities
  end
  lspconfig.cssls.setup({
    capabilities = _capabilities,
    cmd = { "vscode-css-language-server.cmd", "--stdio" },
    filetypes = { "css", "scss", "less" },
    on_attach = on_attach,
    --root_dir = root_pattern("package.json", ".git") or bufdir,
    --https://stackoverflow.com/questions/64868071/i-cannot-activate-nvims-built-in-lsps-for-javascript-and-html
    root_dir = lspconfig.util.root_pattern(".git", "package.json") or vim.loop.cwd(),
    settings = {
      css = {
        validate = true,
      },
      less = {
        validate = true,
      },
      scss = {
        validate = true,
      },
    },
    single_file_support = true,
  })
end

return M
