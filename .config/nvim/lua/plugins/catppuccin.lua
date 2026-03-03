return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		color_overrides = {
			mocha = {
				text = "#F4CDE9",
				subtext1 = "#DEBAD4",
				subtext0 = "#C8A6BE",
				overlay2 = "#B293A8",
				overlay1 = "#9C7F92",
				overlay0 = "#866C7D",
				surface2 = "#705867",
				surface1 = "#5A4551",
				surface0 = "#44313B",
				base = "#352939",
				mantle = "#211924",
				crust = "#1a1016",
			},
		},
	},
	init = function()
		vim.cmd.colorscheme("catppuccin")

		vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
			callback = function()
				local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
				if not normal.bg then
					return
				end
				io.write(string.format("\027]11;#%06x\027\\", normal.bg))
			end,
		})

		vim.api.nvim_create_autocmd("UILeave", {
			callback = function()
				io.write("\027]111\027\\")
			end,
		})
	end,
}
