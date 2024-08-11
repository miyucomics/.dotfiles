require("core.settings")
require("core.keymap")
require("core.bootstrap")

require("lazy").setup("plugins", {
	ui = {
		backdrop = 100,
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

require("custom.congratulator")
require("custom.themer").set_theme("catppuccin-mocha")
