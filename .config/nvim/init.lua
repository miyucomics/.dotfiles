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

require("themer").set_theme("catppuccin")
