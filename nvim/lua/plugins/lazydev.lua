-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
-- used for completion, annotations and signatures of Neovim apis
return {
	'folke/lazydev.nvim',
	ft = 'lua',
	dependencies = {
		{ 'Bilal2453/luvit-meta', lazy = true }
	},
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = 'luvit-meta/library', words = { 'vim%.uv' } }
		}
	}
}