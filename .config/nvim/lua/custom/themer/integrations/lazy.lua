local base16 = require("custom.themer").query_theme("base_16")
local base30 = require("custom.themer").query_theme("base_30")

return {
	LazyReasonPlugin = { fg = base30.red },
	LazyValue = { fg = base30.teal },
	LazyDir = { fg = base16.base05 },
	LazyUrl = { fg = base16.base05 },
	LazyCommit = { fg = base30.green },
	LazyNoCond = { fg = base30.red },
	LazySpecial = { fg = base30.blue },
	LazyReasonFt = { fg = base30.purple },
	LazyOperator = { fg = base30.white },
	LazyReasonKeys = { fg = base30.teal },
	LazyTaskOutput = { fg = base30.white },
	LazyCommitIssue = { fg = base30.pink },
	LazyReasonEvent = { fg = base30.yellow },
	LazyReasonStart = { fg = base30.white },
	LazyReasonRuntime = { fg = base30.blue },
	LazyReasonCmd = { fg = base30.yellow },
	LazyReasonSource = { fg = base30.cyan },
	LazyReasonImport = { fg = base30.white },
	LazyProgressDone = { fg = base30.green },

	LazyH1 = {
		bg = base30.green,
		fg = base30.black,
	},

	LazyButton = {
		bg = base30.black2,
		fg = base30.light_grey,
	},

	LazyH2 = {
		fg = base30.red,
		bold = true,
		underline = true,
	},
}
