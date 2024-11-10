-- Telescope keymaps.
--   See `plugins/telescope.lua` for an introduction to Telescope.

local builtin = require("telescope.builtin")

-- [[ Fuzzy find ]]

-- Fuzzy find based on filename
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Fuzzy find a file based on its filename" })

-- Fuzzy find based on text content
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]repping" })

-- Fuzzy find based on word under cursor
vim.keymap.set("n", "<leader>*", builtin.grep_string, { desc = "Fuzzy find the word under cursor" })

-- Fuzzy find in current buffer
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = "Fuzzy find in current buffer" })

-- Shortcut for searching in NeoVim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[S]earch in [N]eovim configuration files" })

-- [[ Git pickers ]]

vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "[G]it [F]iles" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })

