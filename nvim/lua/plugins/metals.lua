--
-- Scala Metals configuration
--

return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",

		{
			"j-hui/fidget.nvim",
			opts = {},
		},

		{
			"mfussenegger/nvim-dap",
			config = function(self, opts)
				-- Debug settings if you're using nvim-dap
				local dap = require("dap")

				dap.configurations.scala = {
					{
						type = "scala",
						request = "launch",
						name = "RunOrTest",
						metals = {
							runType = "runOrTestFile"
						},
					},
					{
						type = "scala",
						request = "launch",
						name = "Test Target",
						metals = {
							runType = "testTarget",
						},
					},
				}
			end
		},
  },
  ft = { "scala", "sbt", "java" },
	keys = {
		{ "<leader>cM", function () require("telescope").extensions.metals.commands() end }
	},
  opts = function()
    local metals_config = require("metals").bare_config()
		metals_config.settings = {
			autoImportBuild = "all",
			superMethodLensesEnabled = true
		}

		-- Let figet.nvim handle progress notifications
		metals_config.init_options.statusBarProvider = "off"

		-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    metals_config.on_attach = function(client, bufnr)
			require("metals").setup_dap()
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
