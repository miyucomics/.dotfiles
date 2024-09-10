local buffer_map = {}

vim.api.nvim_create_user_command("SetCmd", function(opts)
	local buf = vim.api.nvim_get_current_buf()
	buffer_map[buf] = opts.args
end, { nargs = 1 })

vim.keymap.set("n", "<leader>j", function()
	local buf = vim.api.nvim_get_current_buf()
	local command = buffer_map[buf]

	if command then
		local cwd = vim.fn.expand("%:p:h")
		vim.cmd("cd " .. cwd)
		vim.cmd("silent! !" .. command)
	else
		print("No command set for this instance.")
	end
end, { noremap = true, silent = true })
