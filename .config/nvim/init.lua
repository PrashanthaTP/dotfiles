-- +--------------------------------------------------------------------------+
-- |																	   	  |
-- |							NEOVIM CONFIG                                 |
-- |                                                                          |
-- +--------------------------------------------------------------------------+
--------------------------------------------------------------------------------
--[[

lua
+---autoload
|       cursor.lua
|       
+---general
|       init.lua
|       keymappings.lua
|       languages.lua
|       leader.lua
|       settings.lua
|       
\---plugins
        lsp.lua

]]--
--------------------------------------------------------------------------------
--add init.lua's directory to runtime path
--https://github.com/LunarVim/LunarVim/blob/109c766809760f7a9aba5dfb467d8299d2996de0/init.lua#L1-L6

local init_path = debug.getinfo(1, "S").source:sub(2) -- ~.config/nvim/init.lua
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2) --~.config/nvim

--add init.lua's directory to runtime path
if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

--------------------------------------------------------------------------------
require('general.init')
