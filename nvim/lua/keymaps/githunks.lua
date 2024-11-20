-- Provides keymaps for staging/unstaging/resetting a Git hunk, i.e., a portion
-- of a file.

local M = {}

-- Sets up the keymaps for Git hunks for the given buffer.
--
-- @param bufnr Buffer number.
function M.setup(buf)
	local gitsigns = require("gitsigns")

	local map = function(mode, keys, func, desc)
		vim.keymap.set(mode, keys, func, { buffer = buf, desc = desc })
	end

	-- Goto next change
	map("n", "]c", function() gitsigns.nav_hunk("next") end, "Goto next Git [c]hange")
	map("n", "[c", function() gitsigns.nav_hunk("prev") end, "Goto previous Git [c]hange")

	-- Preview hunk
	map("n", "<Leader>hp", gitsigns.preview_hunk, "[H]unk: [p]review")

	-- Stage hunk
	map("n", "<Leader>hs", gitsigns.stage_hunk, "[H]unk: [s]tage")
	map("v", "<Leader>hs", function()
		gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
	end, "[H]unk: [s]tage")

	-- Unstage hunk
	map("n", "<Leader>hu", gitsigns.undo_stage_hunk, "[H]unk: [u]nstage")

	-- Reset hunk
	map("n", "<Leader>hr", gitsigns.reset_hunk, "[H]unk: [r]eset")
	map("v", "<Leader>hr", function()
		gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
	end, "[H]unk: [r]eset")

	-- Buffer stage/reset
	map("n", "<Leader>hS", gitsigns.stage_buffer, "[H]unk: [s]tage buffer")
	map("n", "<Leader>hR", gitsigns.reset_buffer, "[H]unk: [r]eset buffer")

	-- TODO: Add keymaps for diffs
end

return M
