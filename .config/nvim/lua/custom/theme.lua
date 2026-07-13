local M = {}

vim.g.base46_cache = vim.fn.stdpath("cache") .. "/base46/"
vim.fn.mkdir(vim.g.base46_cache, "p")

local nvconfig = require("nvconfig")

local bespoke_themes = {
	catppuccin = {
		plugin = "catppuccin",
		colorscheme = "catppuccin-mocha",
		opts = {},
	},
}

local function is_base46_theme(name)
	return pcall(require, "base46.themes." .. name)
end

local function reset_highlights()
	vim.cmd("hi clear")
	vim.cmd("syntax reset")
end

local function load_builtin(name)
	local theme = bespoke_themes[name]

	local ok, plugin = pcall(require, theme.plugin)

	if not ok then
		vim.notify(("Couldn't load %s"):format(theme.plugin), vim.log.levels.ERROR)
		return
	end

	if plugin.setup then
		plugin.setup(theme.opts or {})
	end

	vim.cmd.colorscheme(theme.colorscheme)
end

local function load_base46(name)
	nvconfig.base46.theme = name
	package.loaded["base46.themes." .. name] = nil
	require("base46").load_all_highlights()
end

function M.load_theme(name)
	reset_highlights()

	if bespoke_themes[name] then
		load_builtin(name)
	elseif is_base46_theme(name) then
		load_base46(name)
	else
		vim.notify(("Unknown theme '%s'"):format(name), vim.log.levels.ERROR)
		return
	end

	vim.api.nvim_exec_autocmds("ColorScheme", {})
end

local function base46_themes()
	local themes = {}
	local paths = vim.api.nvim_get_runtime_file("lua/base46/themes/*.lua", true)

	for _, path in ipairs(paths) do
		local name = vim.fn.fnamemodify(path, ":t:r")
		if name ~= "init" then
			themes[#themes + 1] = name
		end
	end

	table.sort(themes)
	return themes
end

function M.get_all_themes()
	local items = {}

	for name in pairs(bespoke_themes) do
		items[#items + 1] = {
			name = name,
			provider = "builtin",
		}
	end

	for _, name in ipairs(base46_themes()) do
		if not bespoke_themes[name] then
			items[#items + 1] = {
				name = name,
				provider = "base46",
			}
		end
	end

	table.sort(items, function(a, b)
		return a.name < b.name
	end)

	return items
end

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })

		if normal.bg then
			io.write(string.format("\027]11;#%06x\027\\", normal.bg))
		end
	end,
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.write("\027]111\027\\")
	end,
})

return M
