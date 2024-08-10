-- Thanks to original theme for existing https://github.com/sam4llis/nvim-tundra
-- this is a modified version of it

local M = {}

M.base_30 = {
	white = "#FFFFFF",
	darker_black = "#0b1221",
	black = "#111827",
	black2 = "#1a2130",
	one_bg = "#1e2534",
	one_bg2 = "#282f3e",
	one_bg3 = "#323948",
	grey = "#3e4554",
	grey_fg = "#4a5160",
	grey_fg2 = "#545b6a",
	light_grey = "#5f6675",
	red = "#FCA5A5",
	pink = "#ff8e8e",
	line = "#282f3e",
	green = "#B5E8B0",
	blue = "#A5B4FC",
	yellow = "#E8D4B0",
	purple = "#BDB0E4",
	teal = "#719bd3",
	orange = "#FBC19D",
	cyan = "#BAE6FD",
	statusline_bg = "#171e2d",
	pmenu_bg = "#FCA5A5",
	folder_bg = "#A5B4FC",
}

M.base_16 = {
	base00 = "#111827",
	base01 = "#1e2534",
	base02 = "#282f3e",
	base03 = "#323948",
	base04 = "#3e4554",
	base05 = "#F3F4F6",
	base06 = "#E5E7EB",
	base07 = "#D1D5DB",
	base08 = "#DDD6FE",
	base09 = "#E8D4B0",
	base0A = "#FBC19D",
	base0B = "#B5E8B0",
	base0C = "#BAE6FD",
	base0D = "#BAE6FD",
	base0E = "#FCA5A5",
	base0F = "#9CA3AF",
}

M.type = "dark"

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_30.cyan },
		["@keyword"] = { fg = M.base_30.red },
		["@function.method.call"] = { fg = M.base_30.cyan },
		["@function.call"] = { fg = M.base_30.cyan },
		["@function.builtin"] = { fg = M.base_30.orange },
	},
	syntax = {
		Constant = { fg = M.base_30.orange },
		Conditional = { fg = M.base_30.pink },
		Repeat = { fg = M.base_30.pink },
		Type = { fg = M.base_30.pink },
		Operator = { fg = M.base_30.pink },
	},
}

return M
