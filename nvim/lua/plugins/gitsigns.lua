-- Provides Git modification signs in the signcolumn.

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			-- Setup Git hunks keymaps
			require("keymaps.githunks").setup(bufnr)
		end
	}
}
