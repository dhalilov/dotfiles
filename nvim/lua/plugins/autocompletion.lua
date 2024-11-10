-- `nvim-cmp` is an autocompletion engine that may take multiple sources:
-- LSP, snippets, current buffer, AI assistant, etc.

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Add LSP and path completion sources
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup {
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert {
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),

				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Accept ([y]es) the completion. This will auto-import if the
				-- LSP supports it.
				["<C-y>"] = cmp.mapping.confirm { select = true },

				-- Manually trigger a completion from nvim-cmp
				["<C-Space>"] = cmp.mapping.complete {},
			},
			sources = {
				{
					name = "lazydev",
					-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "path" },
			},
		}
	end
}
