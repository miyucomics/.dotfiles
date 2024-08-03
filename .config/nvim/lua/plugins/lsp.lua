local function on_attach(_, bufnr)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr })
	vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
end

local function on_init(client, _)
	-- we have treesitter, so we'll turn this off for performance
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = { ui = { border = "rounded" } },
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({ float = { border = "rounded" } })

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			capabilities.textDocument.completion.completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			}

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			local lspconfig = require("lspconfig")
			local utils = require("lspconfig.util")

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
								vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
							},
							maxPreload = 100000,
							preloadFileSize = 10000,
						},
					},
				},
			})

			lspconfig.pylsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,
				filetypes = { "python" },
			})

			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,

				root_dir = utils.root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						inlayHints = { locationLinks = false },
						diagnostics = {
							enable = true,
							experimental = {
								enable = true,
							},
						},
						cargo = {
							allFeatures = true,
						},
					},
				},
			})
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		keys = { { "<leader>rr", ":IncRename " } },
		opts = {},
	},
}
