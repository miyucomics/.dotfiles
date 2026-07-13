return {
	{
		"smjonas/inc-rename.nvim",
		keys = { { "<leader>rr", ":IncRename " } },
		opts = {},
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {},
	},
	{
		"kawre/neotab.nvim",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { disable_filetype = { "TelescopePrompt" } },
	},
	{
		"mg979/vim-visual-multi",
		keys = { "<c-down>", "<c-up>", "<c-n>" },
	},
}
