-- Credits to original theme for existing https://github.com/whizkydee/vscode-palenight-theme
-- this is a modified version of it

local M = {}

M.base_30 = {
	white = "#ffffff",
	darker_black = "#232738",
	black = "#292D3E",
	black2 = "#2f3344",
	one_bg = "#333748",
	one_bg2 = "#3c4051",
	one_bg3 = "#444859",
	grey = "#515566",
	grey_fg = "#5b5f70",
	grey_fg2 = "#65697a",
	light_grey = "#6d7182",
	red = "#f07178",
	pink = "#ff5370",
	line = "#3f4354",
	green = "#c3e88d",
	blue = "#82aaff",
	yellow = "#ffcb6b",
	purple = "#c792ea",
	teal = "#89ffe6",
	orange = "#ffa282",
	cyan = "#89ddff",
	statusline_bg = "#2d3142",
	pmenu_bg = "#82aaff",
	folder_bg = "#82aaff",
}

M.base_16 = {
	base00 = "#292d3e",
	base01 = "#444267",
	base02 = "#32374d",
	base03 = "#676e95",
	base04 = "#8796b0",
	base05 = "#d3d3d3",
	base06 = "#efefef",
	base07 = "#ffffff",
	base08 = "#f07178",
	base09 = "#ffa282",
	base0A = "#ffcb6b",
	base0B = "#c3e88d",
	base0C = "#89ddff",
	base0D = "#82aaff",
	base0E = "#c792ea",
	base0F = "#ff5370",
}

M.polish_hl = {
	["@keyword.import"] = { fg = M.base_30.purple },
	["@variable.member.key"] = { fg = M.base_30.orange },
}

M.type = "dark"

return M
