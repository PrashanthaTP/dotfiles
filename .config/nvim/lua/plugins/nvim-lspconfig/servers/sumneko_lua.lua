local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local luaconfig = require('lspconfig')
local M = {}

M.setup = function(on_attach)
    -- Make runtime files discoverable to the server
    local runtime_path = vim.split(package.path, ';')--package path is nvim installation dir/bin/lua

    luaconfig.sumneko_lua.setup {
    capabilities=capabilities,
    cmd = {LUA_LANG_SERVER_EXE, "-E", LUA_LANG_SERVER_MAIN_LUA},
    on_attach=on_attach,
      init_options = {
          provideFormatter = true
        },
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    },
    settings = {
        Lua = {
            runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path
            },
            diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'}
            },
            workspace = {
            -- Make the server aware of Neovim runtime files
            library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
    }
end

return M
