-- Autocommands to highlight references of the word under the cursor,
-- when the cursor is resting

local M = {}

-- Setup the autocommands in the given buffer.
--
-- @param buf Current buffer.
function M.setup(buf)
	local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

	-- Highlight references when resting
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		buffer = buf,
		group = highlight_augroup,
		callback = vim.lsp.buf.document_highlight,
	})

	-- Clear references when moving
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		buffer = buf,
		group = highlight_augroup,
		callback = vim.lsp.buf.clear_references,
	})

	-- Clear these autocommands on LSP detach
	vim.api.nvim_create_autocmd("LspDetach", {
		group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
		callback = function(event)
			vim.lsp.buf.clear_references()
			vim.api.nvim_clear_autocmds { group = highlight_augroup, buffer = event.buf }
		end,
	})
end

return M
