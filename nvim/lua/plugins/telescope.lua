-- Telescope is a fuzzy finder that provides pickers for all sorts of lists. It
-- is mainly used to quickly navigate to a file, but it can also be used to
-- navigate across git branches, fuzzy find in the current file, fuzzy find
-- across a project, etc.
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",

		-- Native fzf sorter for faster performance
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end
		},

		-- Make NeoVim selectors use Telescope by default
		"nvim-telescope/telescope-ui-select.nvim",

		-- Fancy webdev icons
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }
	},
	config = function()
		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- Set Telescope keymaps
		require("keymaps.telescope")
	end
}
