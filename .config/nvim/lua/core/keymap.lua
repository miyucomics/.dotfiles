vim.keymap.set("n", "<c-s>", ":w<cr>", { silent = true })
vim.keymap.set("n", "<c-c>", ":%y+<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", ":wqa<cr>", { silent = true })
vim.keymap.set("n", "<leader>h", ":nohlsearch<cr>", { silent = true })

vim.keymap.set("n", "<leader>d", require("custom.dashboard"))

-- Delete whole word at a time
vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true })

-- No arrow keys
vim.keymap.set("", "<left>", "<nop>")
vim.keymap.set("", "<right>", "<nop>")
vim.keymap.set("", "<down>", "<nop>")
vim.keymap.set("", "<up>", "<nop>")

-- Line number
vim.keymap.set("n", "<leader>n", ":set nu!<cr>", { silent = true })
vim.keymap.set("n", "<leader>rn", ":set rnu!<cr>", { silent = true })

-- Split control
vim.keymap.set("n", "<leader>sx", ":close<cr>", { silent = true })
vim.keymap.set("n", "<leader>sv", "<c-w>v", { silent = true })
vim.keymap.set("n", "<leader>sh", "<c-w>s", { silent = true })
vim.keymap.set("n", "<c-h>", "<c-w>h", { silent = true })
vim.keymap.set("n", "<c-l>", "<c-w>l", { silent = true })
vim.keymap.set("n", "<c-j>", "<c-w>j", { silent = true })
vim.keymap.set("n", "<c-k>", "<c-w>k", { silent = true })

-- Terminals
vim.keymap.set("n", "<leader>th", function()
	require("custom.terminal").new({ pos = "sp" })
end)

vim.keymap.set("n", "<leader>tv", function()
	require("custom.terminal").new({ pos = "vsp" })
end)

vim.keymap.set("", "<leader>tf", function()
	require("custom.terminal").toggle({ pos = "float", id = "floatTerm" })
end)

vim.keymap.set("t", "<c-space>", "<c-\\><c-n>", { silent = true })
