return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			section_separators = "",
			component_separators = "",
			disabled_filetypes = {
				"dashboard",
				"lazy",
				"TelescopePrompt",
				"terminal",
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename" },
			lualine_c = {},
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
