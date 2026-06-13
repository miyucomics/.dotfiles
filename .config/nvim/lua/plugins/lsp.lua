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
		"smjonas/inc-rename.nvim",
		keys = { { "<leader>rr", ":IncRename " } },
		opts = {},
	},
}
