local command = ""

vim.api.nvim_create_user_command("SetCmd", function(opts)
	command = opts.args
end, { nargs = 1 })

vim.keymap.set("n", "<leader>j", function()
	if command then
		local cwd = vim.fn.expand("%:p:h")
		vim.cmd("cd " .. cwd)
		vim.cmd("silent! !" .. command)
	else
		print("No command set")
	end
end, { noremap = true, silent = true })
