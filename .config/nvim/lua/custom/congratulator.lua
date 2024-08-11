local congratulations = {
	" Great job! ✨ ",
	" You're doing great! 💪 ",
	" Keep up the good work! 🌟 ",
	" Well done! 🎉 ",
	" Onward and upward! 🚀 ",
	" You're on fire! 🔥 ",
	" You're a star! ⭐️ ",
	" You're amazing! 🌈 ",
	" That was awesome! 🎈 ",
	" Smart move. 🧠 ",
	" Bravo! 👏 ",
	" Nailed it. 🔨 ",
}

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("Congratulations", { clear = true }),
	callback = function()
		local message = congratulations[math.random(#congratulations)]
		local width = #message
		local buf = vim.api.nvim_create_buf(false, true)
		local win = vim.api.nvim_open_win(buf, false, {
			style = "minimal",
			border = "rounded",
			relative = "editor",
			height = 1,
			width = width,
			col = 0,
			row = 0,
		})
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { message })

		vim.defer_fn(function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
		end, 1000)
	end,
})
