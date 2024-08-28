local icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(_, vim_item)
				vim_item.menu = vim_item.kind
				vim_item.kind = (icons[vim_item.kind] or "") .. " "
				return vim_item
			end,
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "crates" },
            { name = "hexcasting" }
		},
		window = {
			completion = {
				border = "rounded",
				scrollbar = false,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			},
			documentation = {
				border = "rounded",
				scrollbar = false,
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			},
		},
	},
	config = function(_, opts)
        require("custom.hexcasting.hexcasting")
		local cmp = require("cmp")
		opts.mapping = {
			["<c-e>"] = cmp.mapping({
				i = function()
					if cmp.visible() then
						cmp.abort()
						return
					end
					cmp.complete()
				end,
			}),
			["<c-k>"] = cmp.mapping.select_prev_item(),
			["<c-j>"] = cmp.mapping.select_next_item(),
			["<tab>"] = cmp.mapping.confirm({ select = true }),
		}
		cmp.setup(opts)
	end,
}
