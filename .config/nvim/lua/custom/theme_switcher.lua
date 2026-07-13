local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local actions = require("telescope.actions")
local action_set = require("telescope.actions.set")
local action_state = require("telescope.actions.state")

local theme = require("custom.theme")

local function switcher()
	local entries = theme.get_all_themes()

	pickers
		.new({}, {
			prompt_title = "Themes",

			finder = finders.new_table({
				results = entries,

				entry_maker = function(item)
					local type = "light"
					if item.dark then
						type = "dark"
					end
					return {
						value = item,
						display = string.format("%-20s %-8s %s", item.name, item.provider, type),
						ordinal = item.name,
					}
				end,
			}),

			sorter = conf.generic_sorter({}),

			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
				end)

				actions.move_selection_previous:replace(function()
					action_set.shift_selection(prompt_bufnr, -1)
					theme.load_theme(action_state.get_selected_entry().ordinal)
				end)

				actions.move_selection_next:replace(function()
					action_set.shift_selection(prompt_bufnr, 1)
					theme.load_theme(action_state.get_selected_entry().ordinal)
				end)

				vim.api.nvim_create_autocmd("TextChangedI", {
					buffer = prompt_bufnr,
					callback = function()
						if action_state.get_selected_entry() then
							require("custom.themer").set_theme(action_state.get_selected_entry().ordinal)
						end
					end,
				})

				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "<leader>tt", switcher)
