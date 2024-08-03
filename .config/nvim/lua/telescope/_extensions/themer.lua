local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_set = require("telescope.actions.set")
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
                        vim.schedule(function()
                            vim.api.nvim_create_autocmd("TextChangedI", {
                                buffer = prompt_bufnr,
                                callback = function()
                                    if action_state.get_selected_entry() then
                                        require("themer").set_theme(action_state.get_selected_entry()[1])
                                    end
                                end,
                            })
                        end)

                        actions.move_selection_previous:replace(function()
                            action_set.shift_selection(prompt_bufnr, -1)
                            require("themer").set_theme(action_state.get_selected_entry()[1])
                        end)

                        actions.move_selection_next:replace(function()
                            action_set.shift_selection(prompt_bufnr, 1)
                            require("themer").set_theme(action_state.get_selected_entry()[1])
                        end)

                        actions.select_default:replace(function()
                            actions.close(prompt_bufnr)
                        end)

                        return true
                    end,
                })
                :find()
        end,
    },
})
