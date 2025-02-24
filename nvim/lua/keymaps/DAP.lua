local M = {}

-- Configures the DAP keybindings for the given buffer.
--
-- @param buf Current buffer
function M.setup(buf)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = buf, desc = "[D]ebugger: " .. desc })
	end

	local dap = require("dap")

	------
	-- Run
	------

	-- Continue
	map("<leader>dc", dap.continue, "[c]ontinue")

	-- Restart
	map("<leader>dr", dap.restart, "[r]estart")

	-- Re-run last configuration
	map("<leader>dl", dap.run_last, "Run [l]ast configuration")

	-----------
	-- Stepping
	-----------

	-- Step over
	map("<Down>", dap.step_over, "[s]tep [o]ver")

	-- Step into
	map("<S-Down>", dap.step_into, "[s]tep [i]nto")

	-- Step out
	map("<Ctrl-Down>", dap.step_out, "[s]tep [O]ut")

	-- Step back
	map("<Up>", dap.step_back, "[s]tep [b]ack")

	-- Step to cursor
	map("<Right>", dap.run_to_cursor, "[s]tep to [c]ursor")

	--------------
	-- Breakpoints
	--------------

	-- Toggle breakpoint
	map("<leader>bt", dap.toggle_breakpoint, "[t]oggle [b]reakpoint")

	-- List breakpoints
	map("<leader>bl", dap.list_breakpoints, "[l]ist [b]reakpoints")

	-- Clear breakpoints
	map("<leader>bc", dap.clear_breakpoints, "[c]lear [b]reakpoints")

	-------
	-- Misc
	-------

	-- Toggle debug REPL
	map("<leader>dR", dap.repl.toggle, "toggle [R]EPL")

	-- Hover information
	map("<leader>dK", function()
		require("dap.ui.widgets").hover()
	end, "hover")
end

return M
