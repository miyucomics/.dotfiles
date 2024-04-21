return {
	"catppuccin/nvim",
	priority = 1000,
	opts = {
		transparent_background = true,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.o.termguicolors = true
		vim.cmd.colorscheme("catppuccin")
	end,
}
