-- Treesitter is an incremental parsing library. It allows fast and correct
-- syntax highlighting, as opposed to traditional regex-based highlighters, as
-- well as simple goto-definitions and incremental selection.
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "bash", "c", "scala" },
		sync_install = false,
		auto_install = true,

		-- Enable syntax highlighting and indentation
		highlight = { enable = true },
		indent = { enable = true },

		-- Enable incremental selection
		incremental_selection = {
			enable = true,
			keymaps = {
				node_incremental = "+",
				node_decremental = "-",
			}
		}
	}
}
