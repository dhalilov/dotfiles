-- Shows TODO, NOTE, FIXME comments in color

return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	opts = {
		signs = false
	},
}

