return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		init = function()
			require("nvim-treesitter.config").setup({
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					use_languagetree = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			vim.g.no_plugin_maps = true
		end,
	},
}
