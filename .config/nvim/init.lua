require("core.settings")
require("core.keymap")
require("core.bootstrap")

require("lazy").setup("plugins", {
    performance = {
        rtp = {
            disabled_plugins = {
                "editorconfig",
                "gzip",
                "man",
                "netrwPlugin",
                "rplugin",
                "shada",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

require("custom.themer").set_theme("catppuccin")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            require("custom.dashboard")()
        end
    end,
})
