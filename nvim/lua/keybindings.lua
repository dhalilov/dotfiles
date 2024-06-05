--
-- Keybindings
--

-- Open explorer
vim.keymap.set("n", "<Leader>pv", "<cmd>:Ex<CR>")

-- Change current window
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Recenter after up/down motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Recenter after next/previous in searches
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Alt-Backspace for deleting word
-- vim.keymap.set("i", "<C-BS>", "<Esc>caw")

-- Save file
vim.keymap.set("i", "<C-s>", "<Esc>:w<Enter>")
vim.keymap.set("n", "<C-s>", ":w<Enter>")

-- Yank to clipboard
vim.keymap.set("n", "<Leader>y", "\"+y")

-- Paste from clipboard
vim.keymap.set("n", "<Leader>p", "\"+p")
