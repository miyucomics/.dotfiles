local M = {}

vim.g.base46_cache = vim.fn.stdpath("cache") .. "/base46/"
vim.fn.mkdir(vim.g.base46_cache, "p")

local nvconfig = require("nvconfig")

local bespoke_themes = {
	["catppuccin"] = {
		plugin = "catppuccin",
		colorscheme = "catppuccin-mocha",
		dark = true,
	},
	["catppuccin-latte"] = {
		plugin = "catppuccin",
		colorscheme = "catppuccin-latte",
		dark = false,
	},
	["bamboo"] = {
		plugin = "bamboo",
		colorscheme = "bamboo-vulgaris",
		dark = true,
	},
	["fluoromachine"] = {
		plugin = "fluoromachine",
		colorscheme = "fluoromachine",
		opts = { glow = true },
		dark = true,
	},
	["cendre"] = {
		plugin = "cendre",
		colorscheme = "cendre",
		opts = {
			background = "hard",
			italic_virtual_text = false,
		},
		dark = true,
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
		themes[name] = {
			name = name,
			dark = require("base46.themes." .. name).type == "dark",
		}
	end

	return themes
end

function M.get_all_themes()
	local items = {}

	for name in pairs(bespoke_themes) do
		items[#items + 1] = {
			name = name,
			provider = "builtin",
			dark = bespoke_themes[name].dark,
		}
	end

	local base46 = base46_themes()
	for name in pairs(base46) do
		if not bespoke_themes[name] then
			items[#items + 1] = {
				name = base46[name].name,
				provider = "base46",
				dark = base46[name].dark,
			}
		end
	end

	table.sort(items, function(a, b)
		if a.dark ~= b.dark then
			return a.dark
		end
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
