require("core.settings")
require("core.keymap")
require("core.bootstrap")

require("lazy").setup("plugins", {
	rocks = {
		enabled = false,
	},
	ui = {
		backdrop = 100,
		border = "rounded",
	},
	change_detection = {
		enabled = false,
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
