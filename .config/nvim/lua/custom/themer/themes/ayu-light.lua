-- credit to original theme for existing https://github.com/ayu-theme/ayu-vim (light)
-- NOTE : This is a modified version of it

local M = {}

M.base_30 = {
	white = "#26292f",
	darker_black = "#f3f3f3",
	black = "#fafafa",
	black2 = "#efefef",
	one_bg = "#ebebeb",
	one_bg2 = "#e1e1e1",
	one_bg3 = "#d7d7d7",
	grey = "#cdcdcd",
	grey_fg = "#b9b9b9",
	grey_fg2 = "#acacac",
	light_grey = "#a0a0a0",
	red = "#E65050",
	pink = "#ffa5a5",
	line = "#e1e1e1",
	green = "#6CBF43",
	blue = "#399EE6",
	yellow = "#E6BA7E",
	purple = "#9F40FF",
	teal = "#74c5aa",
	orange = "#FA8D3E",
	cyan = "#95E6CB",
	statusline_bg = "#f0f0f0",
	pmenu_bg = "#95E6CB",
	folder_bg = "#5C6166",
}

M.base_16 = {
	base00 = "#fafafa",
	base01 = "#f0f0f0",
	base02 = "#eeeeee",
	base03 = "#dfdfdf",
	base04 = "#d2d2d2",
	base05 = "#5C6166",
	base06 = "#52575c",
	base07 = "#484d52",
	base08 = "#F07171",
	base09 = "#A37ACC",
	base0A = "#399EE6",
	base0B = "#86B300",
	base0C = "#4CBF99",
	base0D = "#55B4D4",
	base0E = "#FA8D3E",
	base0F = "#F2AE49",
}

M.polish_hl = {
	luaTSField = { fg = M.base_16.base0E },
	PmenuSel = { fg = M.base_30.white, bg = M.base_30.pmenu_bg },
	["@tag.delimiter"] = { fg = M.base_30.base0D },
	["@variable.parameter"] = { fg = M.base_16.base09 },
	["@constructor"] = { fg = M.base_16.base0C },
	["@tag.attribute"] = { fg = M.base_30.base0F },
}

M.type = "light"

return M
