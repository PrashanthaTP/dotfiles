local M = {}

M.setup = function(on_attach, capabilities)
  local on_attach_without_formatting = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    on_attach(client, bufnr)
  end

  local capabilities_for_tsserver = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  require("lspconfig").tsserver.setup({
    on_attach = on_attach_without_formatting,
    capabilities = capabilities_for_tsserver,
    cmd = { "typescript-language-server.cmd", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    init_options = {
      hostInfo = "neovim",
    },
    root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
      or vim.loop.cwd(),
    single_file_support = true,
  })
end

return M
