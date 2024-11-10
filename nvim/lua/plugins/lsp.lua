-- Configures LSP servers and capabilities.
--   LSP stands for Language Server Protocol. Each language provides a server
--   to communicate with the client (here Neovim) about its state. Languages
--   servers provides Neovim with capabilities such as goto-definition, find
--   references, autocompletion, symbol search, etc.
--
--   LSPs are configured through `lspconfig` which provides a base configuration
--   for each server.

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason is an external tool installer that helps installing LSP
		-- servers, DAP servers, linters, and formatters.
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Status updates
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function (event)
				-- Setup LSP keymaps
				require("keymaps.lsp").setup(event.buf)

				-- Enable LSP highlight autocommand if possible
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					require("autocommands.highlight-lsp").setup(event.buf)
				end

				-- Enable inlay hints by default
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					vim.lsp.inlay_hint.enable(true)
				end
			end
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace"
						}
					}
				}
			}
		}

		require("mason").setup()

		-- Install LSP servers from Mason
		local ensure_installed = vim.tbl_keys(servers)
		require("mason-tool-installer").setup { ensure_installed = ensure_installed }

		-- Glue Mason LSPs with lspconfig
		require("mason-lspconfig").setup {
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end
			}
		}
	end
}
