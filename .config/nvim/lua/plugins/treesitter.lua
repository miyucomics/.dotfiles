return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	build = ":TSUpdate",
	opts = {
		sync_install = false,
		auto_install = false,
		ensure_installed = { "lua", "json", "css", "html", "javascript" },
		highlight = { enable = true },
	},
}
