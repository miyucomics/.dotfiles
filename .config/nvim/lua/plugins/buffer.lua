return {
	"j-morano/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>b",
			function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
		},
	},
	opts = {
		highlight = "Normal:Normal,FloatBorder:FloatBorder",
		select_menu_item_commands = {
			v = { key = "<leader>sv", command = "vsplit" },
			h = { key = "<leader>sh", command = "split" },
		},
	},
}
