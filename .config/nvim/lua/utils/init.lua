local M = {}

--add init.lua's directory to runtime path
--https://github.com/LunarVim/LunarVim/blob/109c766809760f7a9aba5dfb467d8299d2996de0/init.lua#L1-L6
M.get_base_dir = function()
	local init_path = debug.getinfo(1, "S").source:sub(2) -- get script file full path
	local base_dir = init_path:match("(.*[/\\])"):sub(1, -2) -- get base dir
	return base_dir
end

M.add_runtimepath = function(folder_path)
	if not vim.tbl_contains(vim.opt.rtp:get(), folder_path) then
		vim.opt.rtp:append(folder_path)
	end
end

-- install vim-plug if not already installed
-- @param   : nil
-- @return  : nil
M.install_vim_plug = function()
	vim.cmd([[
let data_dir = has('nvim')?stdpath('data').'/site':"$HOME/.vim"
if empty(glob(data_dir.'/autoload/plug.vim'))
	execute "echo 'Vim-plug not installed.\nInstalling now in \n ".data_dir."'"
	silent execute "!curl -fLo ".data_dir."/autload  --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif
]])
end

M.replace_termcodes = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.os_windows = "win32"
M.os_unix = "unix"
M.os_mac = "mac"
M.os_unknown = "unknown"

M.get_os_name = function()
	local system_name
	if vim.fn.has(M.mac) == 1 then
		system_name = M.mac
	elseif vim.fn.has(M.unix) == 1 then
		system_name = M.unix
	elseif vim.fn.has(M.windows) == 1 then
		system_name = M.windows
	else
		system_name = M.unknown_os
	end
		return system_name
end

return M -- module table
