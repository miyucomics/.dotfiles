return {
    {
        "numToStr/Comment.nvim",
        keys = {
            {
                "<leader>/",
                function()
                    require("Comment.api").toggle.linewise.current()
                end,
            },
            {
                "<leader>/",
                ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
                mode = "v",
                silent = true,
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufEnter",
        opts = {
            signs = false,
            highlight = { multiline = false },
            merge_keywords = false,
            keywords = {
                FIX = { color = "error", alt = { "BUG", "ISSUE" } },
                NOTE = { color = "hint", alt = { "INFO" } },
                TODO = { color = "info" },
                WARN = { color = "warning" },
            },
            colors = {
                error = { "DiagnosticError" },
                hint = { "DiagnosticHint" },
                info = { "DiagnosticInfo" },
                warning = { "DiagnosticWarn" },
            },
        },
    },
}
