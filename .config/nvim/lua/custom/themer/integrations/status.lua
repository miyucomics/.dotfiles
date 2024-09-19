local colors = require("custom.themer").query_theme("base_30")
local base30 = require("custom.themer").query_theme("base_30")

return {
    StatusLine = { bg = colors.darker_black },
    St_EmptySpace = { bg = colors.darker_black },

	St_InsertMode = { fg = base30.black, bg = base30.green },
	St_NormalMode = { fg = base30.black, bg = base30.blue },
	St_VisualMode = { fg = base30.black, bg = base30.purple },
	St_CommandMode = { fg = base30.black, bg = base30.red },
	St_ReplaceMode = { fg = base30.black, bg = base30.orange },
	St_InactiveMode = { fg = base30.black, bg = base30.grey },
	St_TerminalMode = { fg = base30.black, bg = base30.lavender },

	St_InsertModeText = { fg = base30.green, bg = base30.darker_black },
	St_NormalModeText = { fg = base30.blue, bg = base30.darker_black },
	St_VisualModeText = { fg = base30.purple, bg = base30.darker_black },
	St_CommandModeText = { fg = base30.red, bg = base30.darker_black },
	St_ReplaceModeText = { fg = base30.orange, bg = base30.darker_black },
	St_InactiveModeText = { fg = base30.grey, bg = base30.darker_black },
	St_TerminalModeText = { fg = base30.lavender, bg = base30.darker_black },

	St_LspError = { fg = base30.red, bg = base30.darker_black },
	St_LspWarn = { fg = base30.yellow, bg = base30.darker_black },
	St_LspHint = { fg = base30.purple, bg = base30.darker_black },
	St_LspInfo = { fg = base30.blue, bg = base30.darker_black },
}
