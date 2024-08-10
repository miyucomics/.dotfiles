local M = {}

M.base_30 = {
	white = "#cad3f5",
	darker_black = "#1e2030",
	black = "#24273a",
	black2 = "#363a4f",
	one_bg = "#494d64",
	one_bg2 = "#5b6078",
	one_bg3 = "#6e738d",
	grey = "#8087a2",
	grey_fg = "#939ab7",
	grey_fg2 = "#a5adcb",
	light_grey = "#b8c0e0",
	red = "#ed8796",
	baby_pink = "#ee99a0",
	pink = "#f5bde6",
	line = "#494d64",
	green = "#a6da95",
	nord_blue = "#8bd5ca",
	blue = "#8aadf4",
	yellow = "#eed49f",
	sun = "#eed49f",
	purple = "#c6a0f6",
	dark_purple = "#c6a0f6",
	teal = "#8bd5ca",
	orange = "#f5a97f",
	cyan = "#91d7e3",
	statusline_bg = "#363a4f",
	pmenu_bg = "#a6da95",
	folder_bg = "#8aadf4",
	lavender = "#b7bdf8",
}

M.base_16 = {
	base00 = "#24273a",
	base01 = "#363a4f",
	base02 = "#494d64",
	base03 = "#5b6078",
	base04 = "#6e738d",
	base05 = "#939ab7",
	base06 = "#a5adcb",
	base07 = "#b8c0e0",
	base08 = "#ed8796",
	base09 = "#f5a97f",
	base0A = "#eed49f",
	base0B = "#a6da95",
	base0C = "#8bd5ca",
	base0D = "#8aadf4",
	base0E = "#c6a0f6",
	base0F = "#f5bde6",
}

M.polish_hl = {
	["@variable"] = { fg = M.base_30.lavender },
	["@property"] = { fg = M.base_30.teal },
	["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

return M
