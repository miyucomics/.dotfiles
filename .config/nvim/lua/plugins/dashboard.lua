local function button(label, shortcut, run, command)
	return {
		type = "button",
		val = label,
		on_press = function()
			vim.api.nvim_feedkeys(run, "t", false)
		end,
		opts = {
			cursor = 3,
			width = 50,
			position = "center",
			shortcut = shortcut,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
			keymap = { "n", run, command, { noremap = true, silent = true, nowait = true } },
		},
	}
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		layout = {
			{ type = "padding", val = 2 },
			{
				type = "text",
				val = {
					"           ▄ ▄                   ",
					"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
					"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
					"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
					"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
					"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
					"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
					"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
					"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
				},
				opts = {
					position = "center",
					hl = "Function",
				},
			},
			{ type = "padding", val = 2 },
			{
				type = "group",
				val = {
					button("  New file", "e", "e", ":ene<cr>"),
					button("󰈞  Find file", "f", "f", ":Telescope find_files<cr>"),
					button("  Recent files", "o", "o", ":Telescope oldfiles<cr>"),
					button("ⓧ  Quit Neovim", "q", "q", ":wqa<cr>"),
				},
				opts = {
					spacing = 1,
				},
			},
			{
				type = "text",
				val = function()
					local stats = require("lazy").stats()
					return tostring(stats.loaded) .. " / " .. tostring(stats.count) .. " plugins loaded"
				end,
				opts = {
					position = "center",
					hl = "Number",
				},
			},
			{ type = "padding", val = 1 },
			{
				type = "text",
				val = "I use Arch, btw",
				opts = {
					position = "center",
					hl = "DiagnosticInfo",
				},
			},
		},
	},
}
