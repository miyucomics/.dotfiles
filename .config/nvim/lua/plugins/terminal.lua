return {
    "NvChad/nvterm",
    keys = {
        {
            "<leader>th",
            function()
                require("nvterm.terminal").new("horizontal")
            end,
        },
        {
            "<leader>tv",
            function()
                require("nvterm.terminal").new("vertical")
            end,
        },
        {
            "<leader>tf",
            function()
                require("nvterm.terminal").toggle("float")
            end,
        },
        { "<c-space>", "<c-\\><c-n>", silent = true, mode = "t" },
    },
    opts = {
        terminals = {
            type_opts = {
                float = { border = "rounded" },
            },
        },
        behavior = {
            autoclose_on_quit = {
                enabled = true,
                confirm = false,
            },
        },
    },
}
