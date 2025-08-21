require("core.settings")
require("core.keymap")
require("core.bootstrap")

require("custom.themer").set_theme("catppuccin-mocha")

require("lazy").setup("plugins", {
    ui = {
        backdrop = 100,
        border = "rounded"
    },
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

require("custom.runner")
vim.o.statusline = "%!v:lua.require('custom.status')()"
