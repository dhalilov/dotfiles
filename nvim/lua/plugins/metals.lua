-- Metals is the LSP server for Scala projects. It is recommended by
-- `nvim-metals` to configure Metals through its own plugin, instead of using
-- `lspconfig`.

return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "j-hui/fidget.nvim", opts = {} }
	},
	ft = { "scala", "sbt", "java" },
	opts = function ()
		local metals_config = require("metals").bare_config()

		-- Metals settings
		-- TODO: Have a look at enabling inlay hints
		metals_config.settings = {
			autoImportBuild = "all"
		}

		-- Set correct capabilities for Metals
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Make `fidget` capture the status notifications
		metals_config.init_options.statusBarProvider = "off"

		-- LSP attach function
		metals_config.on_attach = function(client, buf)
			-- Setup LSP keymaps and autocommands
			require("keymaps.LSP").setup(buf)
			require("autocommands.highlight-lsp").setup(buf)
		end

		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end
}
