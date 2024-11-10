-- Window management keymaps

-- Change current window using Ctrl+<hjkl>
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Shift focus to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Shift focus to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Shift focus to top window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Shift focus to right window" })

-- Exit terminal mode more easily
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
