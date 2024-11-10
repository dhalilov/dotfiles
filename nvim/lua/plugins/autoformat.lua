-- Automatically formats code on save.
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format { async = true, lsp_format = "fallback" }
			end,
			mode = "",
			desc = "[F]ormat buffer"
		}
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" }
		}
	}
}
