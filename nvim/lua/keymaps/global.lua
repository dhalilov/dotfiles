-- Global NeoVim keymaps

-- Save file in insert/normal mode
vim.keymap.set({"i", "n"}, "<C-s>", "<cmd>w<Return>", { desc = "Save file" })

-- Yank to clipboard
vim.keymap.set({"n", "v"}, "<Leader>y", "\"+y")

-- Paste from clipboard
vim.keymap.set({"n", "v"}, "<Leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<Leader>P", "\"+P")

-- Recenter after up/down motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move around ranges in visual mode
-- NOTE: this overrides the default "J" in visual mode for joining lines, but
--       since I rarely use it I don't feel like this a problem.
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
