return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
		vim.keymap.set("n", "<leader>ff", function()
			conform.format({ lsp_format = "fallback" })
		end)
	end,
}
