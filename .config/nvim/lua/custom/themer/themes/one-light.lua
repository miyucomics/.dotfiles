-- Credits to original https://github.com/one-dark
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#54555b",
	darker_black = "#efeff0",
	black = "#fafafa",
	black2 = "#EAEAEB",
	one_bg = "#dadadb",
	one_bg2 = "#d4d4d5",
	one_bg3 = "#cccccd",
	grey = "#b7b7b8",
	grey_fg = "#b0b0b1",
	grey_fg2 = "#a9a9aa",
	light_grey = "#a2a2a3",
	red = "#d84a3d",
	pink = "#ff75a0",
	line = "#e2e2e2",
	green = "#50a14f",
	blue = "#4078f2",
	yellow = "#c18401",
	purple = "#a28dcd",
	teal = "#519ABA",
	orange = "#FF6A00",
	cyan = "#0b8ec6",
	statusline_bg = "#ececec",
	pmenu_bg = "#5e5f65",
	folder_bg = "#6C6C6C",
}

M.base_16 = {
	base00 = "#fafafa",
	base01 = "#f4f4f4",
	base02 = "#e5e5e6",
	base03 = "#dfdfe0",
	base04 = "#d7d7d8",
	base05 = "#383a42",
	base06 = "#202227",
	base07 = "#090a0b",
	base08 = "#d84a3d",
	base09 = "#d75f00",
	base0A = "#c18401",
	base0B = "#50a14f",
	base0C = "#0070a8",
	base0D = "#4078f2",
	base0E = "#a626a4",
	base0F = "#986801",
}

M.type = "light"

M.polish_hl = {
	TelescopePromptPrefix = { fg = M.base_30.white },
	TelescopeSelection = { bg = M.base_30.one_bg, fg = M.base_30.white },
	["@punctuation.bracket"] = { fg = M.base_30.blue },
	FloatBorder = { fg = M.base_16.base05 },
	Pmenu = { bg = M.base_30.black2 },
	DiffAdd = { fg = M.base_16.base05 },
}

return M
