local lspconfig = require("lspconfig")
local t = require("utils").replace_termcodes
local M = {}

M.set_keymappings = function(bufnr)
  local buf_set_keymap =
      function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = {noremap = true, silent = true}
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", t("<C-k>"), "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                 opts)
  buf_set_keymap("n", t("<space>wa"),
                 "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", t("<space>wr"),
                 "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", t("<space>wl"),
                 "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
                 opts)
  buf_set_keymap("n", t("<space>D"),
                 "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", t("<space>rn"), "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", t("<space>ca"), "<cmd>lua vim.lsp.buf.code_action()<CR>",
                 opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", t("<space>e"),
                 "<cmd>lua vim.diagnostic.open_float(nil,{source='always'})<CR>",
                 opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap("n", t("<space>q"), "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
  -- buf_set_keymap("n", t("<space>wf"), "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- formatting
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
  local buf_set_option =
      function(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  M.set_keymappings(bufnr)
  --[[ if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
  --]]
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command([[augroup FORMAT]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command(
        [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
    vim.api.nvim_command([[augroup end]])
  end
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {spacing = 4, prefix = ""},
        signs = true,
        underline = true,
        update_in_insert = false
      })
  -- protocol.SymbolKind = { }
  vim.lsp.protocol.completionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "" -- TypeParameter
  }
end

return M
