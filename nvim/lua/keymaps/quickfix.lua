-- Keymaps for the quickfix list

-- Add errors to the quickfix list
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist, { desc = "[A]dd [a]ll diagnostics to the quickfix list" })

-- Add errors to the quickfix list
vim.keymap.set("n", "<leader>ae", function()
	vim.diagnostic.setqflist({ severity = "ERROR" })
end, { desc = "[A]dd all [e]rrors to the quickfix list" })

-- Add warnings to the quickfix list
vim.keymap.set("n", "<leader>aw", function()
	vim.diagnostic.setqflist({ severity = "WARN" })
end, { desc = "[A]dd all [w]arnings to the quickfix list" })
