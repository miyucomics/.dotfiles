return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					"${3rd}/love2d/library",
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
