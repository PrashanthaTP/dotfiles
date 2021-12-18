-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- modified-by: PrashanthaTP
local lualine = require("lualine")
-- Color table for highlights
-- stylua: ignore
local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}
local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}
-- Config
local config = {
  options = {
    -- Disable sections and component separators
    --
    component_separators = "|",
    section_separators = "",
    --	section_separators = { left = "", right = "" },
    --	component_separators = { left = "", right = "" },
    theme = "solarized"
    --[===[
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },--]===]
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {"mode"},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end
-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end
--[===[
ins_left({
	function()
		return "▊"
	end,
	color = { fg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})
--]===]
--[===[
ins_left({
	-- mode component
	function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
		return ""
	end,
	color = "LualineMode",
	padding = { right = 1 },
})
--]===]
--
ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  -- color = { fg = colors.magenta, gui = "bold" },
  color = {fg = colors.green, gui = "bold"}
})
ins_left({"branch", icon = "", color = {fg = colors.violet, gui = "bold"}})
ins_left({
  "diagnostics",
  -- table of diagnostic sources, available sources:
  -- 'nvim_lsp', 'nvim', 'coc', 'ale', 'vim_lsp'
  -- Or a function that returns a table like
  --   {error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt}
  sources = {"nvim_diagnostic"},
  -- displays diagnostics from defined severity
  sections = {"error", "warn", "info", "hint"},
  diagnostics_color = {
    -- Same values like general color option can be used here.
    error = {fg = colors.red}, -- changes diagnostic's error color
    warn = {fg = colors.orange}, -- changes diagnostic's warn color
    info = {fg = colors.blue}, -- Changes diagnostic's info color
    hint = {fg = colors.yellow} -- Changes diagnostic's hint color
  },
  symbols = {error = "E", warn = "W", info = "I", hint = "H"},
  colored = true, -- displays diagnostics status in color if set to true
  update_in_insert = false, -- Update diagnostics in insert mode
  always_visible = false -- Show diagnostics even if count is 0, boolean or function returning boolean
})
-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({function() return "%=" end})
ins_right({
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  -- color = { fg = "#ffffff", gui = "bold" },
  color = {fg = colors.green, gui = "bold"}
})
ins_right({"location"})
ins_right({"progress", color = {fg = colors.fg, gui = "bold"}})
-- Add components to right sections
ins_right({
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = {fg = colors.green, gui = "bold"}
})
ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.green, gui = "bold"}
})
ins_right({
  "diff",
  -- Is it me or the symbol for modified us really weird
  -- symbols = { added = " ", modified = " 柳 ", removed = " " },
  symbols = {added = " ", modified = "ﮐ  ", removed = " "},
  diff_color = {
    added = {fg = colors.green},
    modified = {fg = colors.orange},
    removed = {fg = colors.red}
  },
  cond = conditions.hide_in_width
})
ins_right({
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty
})
--[===[
ins_right({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
})
--]===]
-- Now don't forget to initialize lualine
lualine.setup(config)
