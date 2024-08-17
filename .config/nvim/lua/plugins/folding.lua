return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	opts = { open_fold_hl_timeout = 0 },
	init = function()
		vim.o.foldenable = true
		vim.o.foldlevelstart = 99
		vim.o.foldlevel = 99
	end,
}
