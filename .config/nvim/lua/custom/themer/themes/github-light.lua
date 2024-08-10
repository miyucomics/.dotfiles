-- credits to original theme for existing https://github.com/primer/github-vscode-theme
-- This is a modified version of it

local M = {}

M.base_30 = {
	white = "#24292e",
	darker_black = "#f3f5f7",
	black = "#ffffff",
	black2 = "#edeff1",
	one_bg = "#eaecee",
	one_bg2 = "#e1e3e5",
	one_bg3 = "#d7d9db",
	grey = "#c7c9cb",
	grey_fg = "#bcbec0",
	grey_fg2 = "#b1b3b5",
	light_grey = "#a6a8aa",
	red = "#DE2C2E",
	pink = "#b93a86",
	line = "#eaecee",
	green = "#18654B",
	blue = "#0D7FDD",
	yellow = "#dbab09",
	purple = "#8263EB",
	teal = "#22839b",
	orange = "#d15704",
	cyan = "#0598bc",
	statusline_bg = "#edeff1",
	pmenu_bg = "#8263EB",
	folder_bg = "#6a737d",
}

M.base_16 = {
	base00 = "#ffffff",
	base01 = "#edeff1",
	base02 = "#e1e3e5",
	base03 = "#d7d9db",
	base04 = "#c7c9cb",
	base05 = "#383d42",
	base06 = "#2e3338",
	base07 = "#24292e",
	base08 = "#5a32a3",
	base09 = "#b93a86",
	base0A = "#b08800",
	base0B = "#4c2889",
	base0C = "#8263EB",
	base0D = "#005cc5",
	base0E = "#DE2C2E",
	base0F = "#044289",
}

M.type = "light"

M.polish_hl = {
	["@punctuation.bracket"] = { fg = M.base_30.blue },
	["@variable.member.key"] = { fg = M.base_30.white },
	["@constructor"] = { fg = M.base_30.green },
	["@operator"] = { fg = M.base_30.orange },
	Constant = { fg = M.base_16.base07 },
	Tag = { fg = M.base_30.green },
}

return M
