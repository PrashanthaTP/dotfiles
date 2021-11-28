vim.cmd([[
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fn <cmd>lua require('telescope.builtin').find_files({cwd="$HOME/.config"})<cr>
]])

--Dont preview binaries
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local Job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job
		:new({
			command = "file",
			args = { "--mime-type", "-b", filepath },
			on_exit = function(j)
				local mime_type = vim.split(j:result()[1], "/")[1]
				if mime_type == "text" then
					previewers.buffer_previewer_maker(filepath, bufnr, opts)
				else
					-- maybe we want to write something to the buffer here
					vim.schedule(function()
						vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
					end)
				end
			end,
		})
		:sync()
end

require("telescope").setup({
	defaults = {
		--buffer_previewer_maker = new_maker,
		file_ignore_patterns = { "node_modules", "^vim\\view\\", "^vim\\backup\\", "^vim\\swap\\" },
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
})
