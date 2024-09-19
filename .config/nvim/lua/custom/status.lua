local M = {}

M.modes = {
	["n"] = { "NORMAL", "Normal" },
	["no"] = { "NORMAL (no)", "Normal" },
	["nov"] = { "NORMAL (nov)", "Normal" },
	["noV"] = { "NORMAL (noV)", "Normal" },
	["noCTRL-V"] = { "NORMAL", "Normal" },
	["niI"] = { "NORMAL i", "Normal" },
	["niR"] = { "NORMAL r", "Normal" },
	["niV"] = { "NORMAL v", "Normal" },
	["nt"] = { "NTERMINAL", "NTerminal" },
	["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },

	["v"] = { "VISUAL", "Visual" },
	["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
	["V"] = { "V-LINE", "Visual" },
	["Vs"] = { "V-LINE", "Visual" },
	[""] = { "V-BLOCK", "Visual" },

	["i"] = { "INSERT", "Insert" },
	["ic"] = { "INSERT (completion)", "Insert" },
	["ix"] = { "INSERT completion", "Insert" },

	["t"] = { "TERMINAL", "Terminal" },

	["R"] = { "REPLACE", "Replace" },
	["Rc"] = { "REPLACE (Rc)", "Replace" },
	["Rx"] = { "REPLACEa (Rx)", "Replace" },
	["Rv"] = { "V-REPLACE", "Replace" },
	["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
	["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

	["s"] = { "SELECT", "Select" },
	["S"] = { "S-LINE", "Select" },
	[""] = { "S-BLOCK", "Select" },
	["c"] = { "COMMAND", "Command" },
	["cv"] = { "COMMAND", "Command" },
	["ce"] = { "COMMAND", "Command" },
	["cr"] = { "COMMAND", "Command" },
	["r"] = { "PROMPT", "Confirm" },
	["rm"] = { "MORE", "Confirm" },
	["r?"] = { "CONFIRM", "Confirm" },
	["x"] = { "CONFIRM", "Confirm" },
	["!"] = { "SHELL", "Terminal" },
}

M.current_buffer = function()
	return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local background = ""
local textColor = ""

M.mode = function()
	local m = vim.api.nvim_get_mode().mode
	local modes = M.modes[m]
    background = "%#St_" .. modes[2] .. "Mode#"
    textColor = "%#St_" .. modes[2] .. "ModeText#"
	return background .. " " .. modes[1] .. " " .. textColor .. " "
end

M.file = function()
	local icon = ""
	local path = vim.api.nvim_buf_get_name(M.current_buffer())
	local name = (path == "" and "Empty ") or path:match("([^/\\]+)[/\\]*$")

	if name ~= "Empty " then
		local devicons_present, devicons = pcall(require, "nvim-web-devicons")
		if devicons_present then
			local ft_icon = devicons.get_icon(name)
			icon = (ft_icon ~= nil and ft_icon) or icon
		end
	end

	return " " .. icon .. " " .. name .. " %m"
end

M.diagnostics = function()
	if not rawget(vim, "lsp") then
		return ""
	end

	local output = ""

	for name, diagnostic in pairs({
		Error = { " ", vim.diagnostic.severity.ERROR },
		Warn = { " ", vim.diagnostic.severity.WARN },
		Hint = { "󰛩 ", vim.diagnostic.severity.HINT },
		Info = { "󰋼 ", vim.diagnostic.severity.INFO },
	}) do
		local count = #vim.diagnostic.get(M.current_buffer(), { severity = diagnostic[2] })
		local cleaned = (count and count > 0) and ("%#St_lsp" .. name .. "#" .. diagnostic[1] .. count .. " ") or ""
		output = output .. cleaned
	end

	return output
end

M.cursor = " %p%% "
M.cursorpos = " %l:%v "
M.textColorRestore = function()
    return textColor
end
M.backgroundRestore = function()
    return background
end
M["%="] = "%="

return function()
	local result = {}
	for _, v in ipairs({ "mode", "file", "%=", "diagnostics", "textColorRestore", "cursor", "backgroundRestore", "cursorpos" }) do
		local module = M[v]
		module = type(module) == "string" and module or module()
		table.insert(result, module)
	end
	return table.concat(result)
end
