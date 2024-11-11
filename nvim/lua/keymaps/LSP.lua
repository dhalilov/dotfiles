-- Setup LSP keymaps.

local M = {}

-- Setup the LSP keymaps relative to the given buffer.
--
-- @param buf Current buffer.
function M.setup(buf)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = buf, desc = "LSP: " .. desc })
	end

	local telescope = require("telescope.builtin")

	-- Goto definition
	map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")

	-- Find references
	map("gr", telescope.lsp_references, "[G]oto [R]eferences")

	-- Goto implementation
	map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")

	-- Jump to the type of the word under the cursor
	map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")

	-- Fuzzy find all the symbols in current document
	map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")

	-- Fuzzy find all the symbols in current workspace
	map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- Rename variable
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

	-- Execute code action
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

	-- Run code lens
	map("<leader>cl", vim.lsp.codelens.run, "Run [C]ode [L]ens")

	-- Hover documentation
	map("K", vim.lsp.buf.hover, "Hover documentation")

	-- Goto declaration
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

return M
