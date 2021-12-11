--https://sbulav.github.io/vim/neovim-telescope-github/
function _G.save_and_exec()
  vim.cmd([[silent! write]])
  if vim.bo.filetype == "lua" then
    require("plenary.reload").reload_module(vim.fn.expand("%"))
    vim.cmd([[:luafile %]])
    print("Reloaded buffer : ", vim.fn.expand("%"))
  elseif vim.bo.filetype == "vim" then
    vim.cmd([[:source %]])
    print("Reloaded buffer : ", vim.fn.expand("%"))
  else
    print("Only vim or lua files can be reloaded")
  end
end

local getLocListCount = function()
  return vim.fn.getloclist(0, { size = 0 }).size --note size should not inside string
end

function _G.performLocListNext()
  local llistCount = getLocListCount()
  if llistCount == 1 then
    vim.cmd("lfirst")
  else
    vim.cmd("lnext")
  end
end

function _G.performLocListNext()
  local llistCount = getLocListCount()
  if llistCount == 1 then
    vim.cmd("lfirst")
  else
    vim.cmd("lprev")
  end
end

function _G.navigateLocationList(direction)
  local llistCount = getLocListCount()
  if llistCount == 0 then
    print("No items in Location List")
  elseif llistCount == 1 then
    vim.cmd("lfirst")
  else
    vim.cmd("l" .. direction)
  end
end
