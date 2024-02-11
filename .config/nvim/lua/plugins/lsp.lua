local servers = { "lua_ls", "pylsp", "rust_analyzer" }

return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufAdd",
		opts = { ensure_installed = servers },
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufAdd",
        keys = {
            { "K", vim.lsp.buf.hover },
            { "<leader>gd", vim.lsp.buf.definition },
            { "<leader>gr", vim.lsp.buf.references },
            { "<leader>ca", vim.lsp.buf.code_action },
        },
		config = function()
			vim.diagnostic.config({ float = { border = "rounded" } })
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}
			local lspconfig = require("lspconfig")
			for _, server in pairs(servers) do
				lspconfig[server].setup({ handlers = handlers })
			end
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = "BufAdd",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.luasnip,
					null_ls.builtins.formatting.rustfmt,
				},
			})
			vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
		end,
	},
	{
		"smjonas/inc-rename.nvim",
        keys = { { "<leader>rr", ":IncRename " } },
		opts = {},
	},
}
