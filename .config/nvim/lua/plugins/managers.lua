return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = {
			ui = {
				backdrop = 100,
				border = "rounded",
			},
		},
	},
	{
		"romus204/tree-sitter-manager.nvim",
		cmd = { "TSManager", "TSInstall", "TSUninstall", "TSUpdate" },
		opts = {
			assume_installed = {
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
		},
	},
}
