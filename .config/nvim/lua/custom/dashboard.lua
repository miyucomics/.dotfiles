local header = {
    "           ▄ ▄                   ",
    "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
    "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
    "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
    "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
    "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
}

local buttons = {
    { "Find File",    "Spc f f", "Telescope find_files" },
    { "Recent Files", "Spc f o", "Telescope oldfiles" },
    { "Find Word",    "Spc f g", "Telescope live_grep" },
    { "Themes",       "Spc c t", "Telescope themer" },
}

local empty = string.rep(" ", #header[1])
table.insert(header, empty)
table.insert(header, empty)

local function make_clean_buffer(filetype)
    vim.opt_local.buflisted = false
    vim.opt_local.modifiable = false
    vim.opt_local.buftype = "nofile"
    vim.opt_local.number = false
    vim.opt_local.list = false
    vim.opt_local.wrap = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.colorcolumn = "0"
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.filetype = filetype
end

local function padButtons(button)
    local rawLength = vim.fn.strwidth(button[1]) + vim.fn.strwidth(button[2])
    local extraSpacing = vim.fn.strwidth(header[1]) - rawLength
    return button[1] .. string.rep(" ", extraSpacing) .. button[2]
end

local function center(windowWidth, str)
    local padding = (windowWidth - vim.fn.strwidth(str)) / 2
    return string.rep(" ", math.floor(padding)) .. str
end

return function()
    local win = vim.api.nvim_get_current_win()
    local window_height = vim.api.nvim_win_get_height(win)
    local window_width = vim.api.nvim_win_get_width(win)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(win, buf)

    local render = {}
    for i = 1, window_height do
        render[i] = ""
    end
    local container_start = math.floor((window_height / 2) - (#header / 2 + #buttons))
    local pointer = container_start
    for _, row in ipairs(header) do
        render[pointer] = center(window_width, row)
        pointer = pointer + 1
    end
    for _, button in ipairs(buttons) do
        render[pointer] = center(window_width, padButtons(button))
        pointer = pointer + 1
        render[pointer] = empty
        pointer = pointer + 1
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, render)

    local highlightGroup = vim.api.nvim_create_namespace("dashboard")
    for i = container_start, container_start + #header - 1 do
        vim.api.nvim_buf_add_highlight(buf, highlightGroup, "DashHeader", i - 1, 0, -1)
    end
    for i = 0, #buttons - 1 do
        vim.api.nvim_buf_add_highlight(buf, highlightGroup, "DashButtons", container_start + #header + i * 2 - 1, 0, -1)
    end

    local first_button = container_start + #header
    local padding_start = (window_width - vim.fn.strwidth(header[1])) / 2
    vim.api.nvim_win_set_cursor(win, { first_button, padding_start })

    vim.keymap.set("", "h", "<nop>", { buffer = true })
    vim.keymap.set("", "l", "<nop>", { buffer = true })
    vim.keymap.set("", "v", "<nop>", { buffer = true })
    vim.keymap.set("", "q", ":q<cr>", { buffer = true })

    vim.keymap.set("", "k", function()
        local cur = vim.fn.line(".")
        if cur - first_button ~= 0 then
            vim.api.nvim_win_set_cursor(win, { cur - 2, padding_start })
        end
    end, { buffer = true })

    vim.keymap.set("", "j", function()
        local cur = vim.fn.line(".")
        if (cur - first_button) / 2 ~= #buttons - 1 then
            vim.api.nvim_win_set_cursor(win, { cur + 2, padding_start })
        end
    end, { buffer = true })

    vim.keymap.set("", "<cr>", function()
        local action = buttons[(vim.fn.line(".") - first_button) / 2 + 1][3]
        if type(action) == "string" then
            vim.cmd(action)
        elseif type(action) == "function" then
            action()
        end
    end, { buffer = true })

    make_clean_buffer("dashboard")
end
