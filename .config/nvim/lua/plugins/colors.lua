return {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
        require("catppuccin").setup({})
        vim.o.termguicolors = true
        vim.cmd.colorscheme("catppuccin")
    end,
}
