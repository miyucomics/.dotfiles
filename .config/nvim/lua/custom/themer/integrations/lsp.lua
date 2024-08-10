local colors = require("custom.themer").query_theme("base_30")
local colorize = require("color_utils").change_hex_lightness

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
        bg = colorize(colors.black2, vim.o.bg == "dark" and 0 or 3),
        fg = colors.light_grey,
    },
}
