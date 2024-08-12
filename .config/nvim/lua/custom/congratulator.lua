local saveCounter = 0

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("Congratulations", { clear = true }),
	callback = function()
		saveCounter = saveCounter + 1

		local message = "Save #" .. tostring(saveCounter) .. "!"
		local width = #message
		local buf = vim.api.nvim_create_buf(false, true)
		local win = vim.api.nvim_open_win(buf, false, {
			style = "minimal",
			border = "rounded",
			relative = "cursor",
			height = 1,
			width = width,
			row = 0,
			col = 0,
		})
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { message })

		vim.defer_fn(function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
		end, 1000)
	end,
})
