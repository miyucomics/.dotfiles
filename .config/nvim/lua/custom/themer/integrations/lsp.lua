local colors = require("custom.themer").query_theme("base_30")

return {
	-- LSP References
	LspReferenceText = { fg = colors.darker_black, bg = colors.white },
	LspReferenceRead = { fg = colors.darker_black, bg = colors.white },
	LspReferenceWrite = { fg = colors.darker_black, bg = colors.white },

	-- Lsp Diagnostics
	DiagnosticHint = { fg = colors.purple },
	DiagnosticError = { fg = colors.red },
	DiagnosticWarn = { fg = colors.yellow },
	DiagnosticInfo = { fg = colors.green },
	LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },

	RenamerTitle = { fg = colors.black, bg = colors.red },
	RenamerBorder = { fg = colors.red },

	LspInlayHint = {
		bg = colors.black2,
		fg = colors.light_grey,
	},
}
