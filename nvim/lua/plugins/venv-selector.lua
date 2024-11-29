-- `venv-selector.nvim` allows one to select its Python virtual environment
-- inside Neovim.

return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
	branch = "regexp", -- Recommended, up-to-date branch
	opts = {},
	event = "VeryLazy", -- Needed only if you want to type `:VenvSelect` without a keymapping
}
