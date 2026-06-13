return {
	"saghen/blink.cmp",
	version = "1.*",
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
}
