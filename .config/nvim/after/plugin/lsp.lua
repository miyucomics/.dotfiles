vim.diagnostic.config({
     -- lsp_lines.nvim renders the errors as lines
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
