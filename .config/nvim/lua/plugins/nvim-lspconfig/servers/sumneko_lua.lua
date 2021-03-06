-- Sumneko Language Server
-- formatting not supported
local lspconfig = require("lspconfig")
local M = {}
M.setup = function(on_attach, capabilities)
  -- Make runtime files discoverable to the server
  local runtime_path = vim.split(package.path, ";") -- package path is nvim installation dir/bin/lua
  local _capabilities = nil
  if capabilities == nil then
    _capabilities = vim.lsp.protocol.make_client_capabilities()
    _capabilities.textDocument.completion.completionItem.snippetSupport = true
  else
    _capabilities = capabilities
  end
  lspconfig.sumneko_lua.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)
    end,
    capabilities = _capabilities,
    cmd = {LUA_LANG_SERVER_EXE, "-E", LUA_LANG_SERVER_MAIN_LUA},

    root_dir = lspconfig.util.root_pattern(".git", ".stylua.toml") or
        vim.loop.cwd(),

    single_file_support = false,
    init_options = {provideFormatter = true},
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim"}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  })
end
return M
