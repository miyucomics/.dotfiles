return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader><leader>", ":Telescope find_files<cr>" },
		{ "<leader>cm", ":Telescope git_commits<cr>" },
		{ "<leader>ct", ":Telescope themer<cr>" },
		{ "<leader>fb", ":Telescope buffers<cr>" },
		{ "<leader>fo", ":Telescope old_files<cr>" },
		{ "<leader>fg", ":Telescope live_grep<cr>" },
		{ "<leader>fh", ":Telescope help_tags<cr>" },
		{ "<leader>fz", ":Telescope current_buffer_fuzzy_find<cr>" },
		{ "<leader>gt", ":Telescope git_status<cr>" },
		{ "<leader>ma", ":Telescope marks<cr>" },
	},
	opts = {
		defaults = {
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			path_display = { "truncate" },
			border = {},
			color_devicons = true,
		},
	},
	config = function(_, opts)
		local actions = require("telescope.actions")
		opts.defaults.mappings = {
			i = {
				["<esc>"] = actions.close,
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous,
			},
		}
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("themer")
	end,
}
