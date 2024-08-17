local Themer = {}
local current_theme = {}

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			require("custom.dashboard")()
		end
	end,
})

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		if not normal.bg then
			return
		end
		io.write(string.format("\027]11;#%06x\027\\", normal.bg))
	end,
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.write("\027]111\027\\")
	end,
})

Themer.set_theme = function(name)
	local present, theme = pcall(require, "custom.themer.themes." .. name)
	if not present then
		error("No such theme!")
	end

	current_theme = theme
	Themer.sync_hl_groups()
	Themer.polish_themes()
	Themer.sync_terminal()
end

Themer.sync_hl_groups = function()
	local directory = vim.fn.stdpath("config") .. "/lua/custom/themer/integrations/"
	local files = vim.fn.readdir(directory)
	for _, file in ipairs(files) do
		local settings = dofile(directory .. "/" .. file)
		for key, value in pairs(settings) do
			vim.api.nvim_set_hl(0, key, value)
		end
	end
end

Themer.polish_themes = function()
	if current_theme["polish_hl"] ~= nil then
		for key, value in pairs(current_theme["polish_hl"]) do
			vim.api.nvim_set_hl(0, key, value)
		end
	end
end

Themer.sync_terminal = function()
	vim.api.nvim_exec_autocmds("ColorScheme", {})

	local term = {
		"base01",
		"base08",
		"base0B",
		"base0A",
		"base0D",
		"base0E",
		"base0C",
		"base05",
		"base03",
		"base08",
		"base0B",
		"base0A",
		"base0D",
		"base0E",
		"base0C",
		"base07",
	}

	for i = 0, 15 do
		vim.g["terminal_color_" .. i] = current_theme.base_16[term[i + 1]]
	end
end

Themer.query_theme = function(property)
	return current_theme[property]
end

return Themer
