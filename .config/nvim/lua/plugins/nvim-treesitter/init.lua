require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"json",
		"html",
		"lua",
		"python",
		"tsx",
		"scss",
	},
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = { "javascript", "reactjavascript", "typescript.tsx" }
parser_config.scss.used_by = { "css" }

--require 'nvim-treesitter.install'.compilers = { "clang","clangd" ,"gcc"}

require("nvim-treesitter.install").compilers = { "clang" }
