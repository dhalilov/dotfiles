-- Search-related keymaps

-- Clear highlighted search results by pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlighted search results" })

-- Recenter after next/previous in searches
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

