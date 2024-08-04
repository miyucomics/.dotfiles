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

local extra_width = 10
local container_size = vim.fn.strwidth(header[1]) + extra_width

local function wrap_string(string)
	local result = {}
	local current_line = ""

	for word in string:gmatch("%S+") do
		if #current_line + #word <= container_size then
			if #current_line > 0 then
				current_line = current_line .. " "
			end
			current_line = current_line .. word
		else
			table.insert(result, current_line)
			current_line = word
		end
	end

	if #current_line > 0 then
		table.insert(result, current_line)
	end

	return result
end

local buttons = {
	{ "Find File", "Spc f f", "Telescope find_files" },
	{ "Recent Files", "Spc f o", "Telescope oldfiles" },
	{ "Find Word", "Spc f g", "Telescope live_grep" },
	{ "Themes", "Spc c t", "Telescope themer" },
}

local quote = "\"If there's a book that you want to read, but it hasn't been written yet, then you must write it.\""
local quote_segments = wrap_string(quote)

local empty = string.rep(" ", container_size)
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

local function fill_button(button)
	local raw_length = vim.fn.strwidth(button[1]) + vim.fn.strwidth(button[2])
	local needed = container_size - raw_length
	return button[1] .. string.rep(" ", needed) .. button[2]
end

local function center(window_width, str)
	local padding = (window_width - vim.fn.strwidth(str)) / 2
	return string.rep(" ", math.floor(padding)) .. str
end

return function()
	local window = vim.api.nvim_get_current_win()
	local window_height = vim.api.nvim_win_get_height(window)
	local window_width = vim.api.nvim_win_get_width(window)
	local buffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_win_set_buf(window, buffer)

	local render = {}
	for i = 1, window_height do
		render[i] = ""
	end
	local container_start = math.floor((window_height / 2) - (#header + #buttons * 2 + #quote_segments + 1) / 2)
	local pointer = container_start
	for _, row in ipairs(header) do
		render[pointer] = center(window_width, row)
		pointer = pointer + 1
	end
	for _, button in ipairs(buttons) do
		render[pointer] = center(window_width, fill_button(button))
		pointer = pointer + 1
		render[pointer] = empty
		pointer = pointer + 1
	end
	pointer = pointer + 1
	for _, segment in ipairs(quote_segments) do
		render[pointer] = center(window_width, segment)
		pointer = pointer + 1
	end
	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, render)

	local namespace = vim.api.nvim_create_namespace("dashboard")
	for i = container_start, container_start + #header - 1 do
		vim.api.nvim_buf_add_highlight(buffer, namespace, "DashHeader", i - 1, 0, -1)
	end
	for i = 0, #buttons - 1 do
		vim.api.nvim_buf_add_highlight(buffer, namespace, "DashButtons", container_start + #header + i * 2 - 1, 0, -1)
	end
	for i = 1, #quote_segments do
		vim.api.nvim_buf_add_highlight(buffer, namespace, "DashQuote", container_start + #header + (#buttons - 1) * 2 + i + 1, 0, -1)
	end

	local first_button = container_start + #header
	local padding_start = math.floor((window_width - container_size) / 2)
	vim.api.nvim_win_set_cursor(window, { first_button, padding_start })

	vim.keymap.set("", "h", "<nop>", { buffer = true })
	vim.keymap.set("", "l", "<nop>", { buffer = true })
	vim.keymap.set("", "v", "<nop>", { buffer = true })
	vim.keymap.set("", "q", ":q<cr>", { buffer = true })

	vim.keymap.set("", "k", function()
		local cur = vim.fn.line(".")
		if cur ~= first_button then
			vim.api.nvim_win_set_cursor(window, { cur - 2, padding_start })
		end
	end, { buffer = true })

	vim.keymap.set("", "j", function()
		local cur = vim.fn.line(".")
		if cur ~= first_button + (#buttons - 1) * 2 then
			vim.api.nvim_win_set_cursor(window, { cur + 2, padding_start })
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
