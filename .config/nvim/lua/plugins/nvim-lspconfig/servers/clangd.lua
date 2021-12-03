local lspconfig = require("lspconfig")

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "compile_flags.txt", ".git", ".clangd")
      or vim.loop.cwd(),
    single_file_support = true,
  })
end
return M
