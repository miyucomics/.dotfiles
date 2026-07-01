local M = {}

local cache_dir = vim.fn.stdpath("cache") .. "/theme_cache/"
if vim.fn.isdirectory(cache_dir) == 0 then
	vim.fn.mkdir(cache_dir, "p")
end

local bespoke_themes = {
	["catppuccin"] = { plugin = "catppuccin", colorscheme = "catppuccin-mocha" },
}

local function compile_to_bytecode(filename, str)
	local cache_path = cache_dir .. filename
	local lines = "return string.dump(function()" .. str .. "end, true)"
	local file = io.open(cache_path, "wb")
	if file then
		local success, bytecode = pcall(loadstring(lines))
		if success and bytecode then
			file:write(bytecode())
		end
		file:close()
	end
end

local function table_to_string(tb)
	local result = ""
	for hlgroup, opts in pairs(tb) do
		local hlopts = ""
		for optName, optVal in pairs(opts) do
			local valStr = (type(optVal) == "boolean" or type(optVal) == "number") and tostring(optVal)
				or '"' .. optVal .. '"'
			hlopts = hlopts .. optName .. "=" .. valStr .. ","
		end
		result = result .. "vim.api.nvim_set_hl(0,'" .. hlgroup .. "',{" .. hlopts .. "})"
	end
	return result
end

M.load_theme = function(name)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	if bespoke_themes[name] then
		local target = bespoke_themes[name]
		local status, plugin = pcall(require, target.plugin)
		if status then
			plugin.setup({})
			vim.cmd.colorscheme(target.colorscheme)
			return
		end
	end

	local has_base46, base46_core = pcall(require, "base46")
	local has_theme, palette = pcall(require, "base46.themes." .. name)
	if has_base46 and has_theme then
		vim.g.nvconfig = { base46 = { theme = name, transparency = false, hl_override = {} } }

		-- Compile standard framework integrations (like telescope) using base46 logic
		-- We piggyback off their integration lists
		local target_integrations = { "defaults", "syntax", "treesitter", "telescope", "devicons" }

		for _, integration in ipairs(target_integrations) do
			local ok, hl_table = pcall(require, "base46.integrations." .. integration)
			if ok then
				-- Inject the base46 theme overrides safely
				if base46_core.extend_default_hl then
					hl_table = base46_core.extend_default_hl(hl_table, integration)
				end
				local hl_string = table_to_string(hl_table)
				compile_to_bytecode(integration, hl_string)

				-- Instantly execute binary cache
				dofile(cache_dir .. integration)
			end
		end

		vim.api.nvim_exec_autocmds("User", { pattern = "ThemeChanged" })
	end
end

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

return M
