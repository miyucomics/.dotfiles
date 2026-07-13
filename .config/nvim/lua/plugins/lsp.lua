return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		opts = {
			keymap = {
				["<c-e>"] = { "show", "hide" },
				["<c-k>"] = { "select_prev" },
				["<c-j>"] = { "select_next" },
				["<c-h>"] = { "scroll_documentation_up" },
				["<c-l>"] = { "scroll_documentation_down" },
				["<tab>"] = { "select_and_accept", "fallback" },
			},
			signature = { enabled = true },
			completion = {
				documentation = { auto_show = true },
				ghost_text = { enabled = true },
				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label" }, { "kind" } },
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = true,
				signs = true,
				underline = true,
				float = {
					border = "rounded",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
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
					properties = { "documentation", "detail", "additionalTextEdits" },
				},
			}

			vim.lsp.config("*", {
				capabilities = capabilities,
				on_init = function(client, _)
					if client:supports_method("textDocument/semanticTokens") then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})

			for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/lsp")) do
				local server = file:gsub("%.lua$", "")
				local overrides = require("lsp." .. server)
				vim.lsp.config(server, overrides)
				vim.lsp.enable(server)
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "BufReadPost",
		dependencies = { "kevinhwang91/promise-async" },
		opts = { open_fold_hl_timeout = 0 },
		init = function()
			vim.o.foldenable = true
			vim.o.foldlevelstart = 99
			vim.o.foldlevel = 99
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
			},
		},
	},
}
