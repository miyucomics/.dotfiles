return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort" },
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
		vim.keymap.set("n", "<leader>ff", function()
			conform.format({
				lsp_format = "fallback",
			})
		end)
	end,
}
