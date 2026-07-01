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
	"neovim/nvim-lspconfig",
	{
		"smjonas/inc-rename.nvim",
		keys = { { "<leader>rr", ":IncRename " } },
		opts = {},
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		opts = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {},
	},
}
