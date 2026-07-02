local position_data = {
	sp = { resize = "height", area = "lines" },
	vsp = { resize = "width", area = "columns" },
}

local function display(opts)
	vim.cmd(opts.pos)
	local window = vim.api.nvim_get_current_win()

	local position_type = position_data[opts.pos]
	local size = opts.size or 0.5
	local new_size = vim.o[position_type.area] * size
	vim.api["nvim_win_set_" .. position_type.resize](0, math.floor(new_size))

	vim.wo[window].number = false
	vim.wo[window].relativenumber = false
	vim.wo[window].scrolloff = 0

	vim.cmd("startinsert")
end

local function new(opts)
	local bufnr = vim.api.nvim_create_buf(false, true)
	display(opts)
	vim.api.nvim_win_set_buf(0, bufnr)
	vim.cmd("terminal " .. (opts.cmd or vim.o.shell))
end

vim.keymap.set("n", "<leader>th", function()
	new({ pos = "sp" })
end)

vim.keymap.set("n", "<leader>tv", function()
	new({ pos = "vsp" })
end)

vim.keymap.set("t", "<c-space>", "<c-\\><c-n>", { silent = true })
