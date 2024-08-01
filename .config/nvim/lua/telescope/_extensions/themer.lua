local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

return require("telescope").register_extension({
    exports = {
        themer = function()
            local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/custom/themer/themes/")
            local choices = {}
            for _, file in pairs(files) do
                table.insert(choices, file:sub(1, -5))
            end
            pickers
                .new({}, {
                    prompt_title = "Themes",
                    finder = finders.new_table({
                        results = choices,
                    }),
                    sorter = conf.generic_sorter({}),
                    attach_mappings = function(prompt_bufnr, _)
                        actions.select_default:replace(function()
                            actions.close(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            require("themer").set_theme(selection[1])
                        end)
                        return true
                    end,
                })
                :find()
        end,
    },
})
