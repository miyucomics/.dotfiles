return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader><leader>",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "<leader>ct", ":Telescope themer<cr>"
        },
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
        require("telescope").load_extension("themer")
    end,
}
