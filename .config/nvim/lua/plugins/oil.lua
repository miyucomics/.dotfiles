return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"-",
			function()
				require("oil").open()
			end,
		},
	},
	opts = {
		skip_confirm_for_simple_edits = true,
		use_default_keymaps = false,
		keymaps = {
			["-"] = "actions.parent",
			["<cr>"] = "actions.select",
			["<leader>sv"] = "actions.select_vsplit",
			["<leader>sh"] = "actions.select_split",
		},
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, _)
				return name == ".."
			end,
		},
	},
}
