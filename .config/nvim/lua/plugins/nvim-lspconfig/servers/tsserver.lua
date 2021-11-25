local M = {}

M.setup = function (on_attach)

require "lspconfig".tsserver.setup {
    cmd = { "typescript-language-server.cmd", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")

}

end
return M
