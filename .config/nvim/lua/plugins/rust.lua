return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
			vim.lsp.inlay_hint.enable(true)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = "toml",
		dependencies = "hrsh7th/nvim-cmp",
		opts = {
			completion = {
				cmp = {
					enabled = true,
				},
			},
		},
		config = function(_, opts)
			require("crates").setup(opts)
			require("crates.completion.cmp").setup()
		end,
	},
}
