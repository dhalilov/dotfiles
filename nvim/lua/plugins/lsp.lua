return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event) 
	local map = function(keys, func)
	  vim.keymap.set('n', keys, func, { buffer = event.buf })
	end

	local telescope = require('telescope.builtin')

	-- Go to definition
	map('gd', telescope.lsp_definitions)

	-- Find references
	map('gr', telescope.lsp_references)

	-- Go to implementation
	map('gI', telescope.lsp_implementations)

	-- Jump to the type of the word under cursor
	map('<leader>D', telescope.lsp_type_definitions)

	-- Fuzzy find all symbols in current document
	map('<leader>ds', telescope.lsp_document_symbols)

	-- Fuzzy find all symbols in current workspace
	map('<leader>ws', telescope.lsp_dynamic_workspace_symbols)

	-- Rename variable
	map('<leader>rn', vim.lsp.buf.rename)

	-- Code action
	map('<leader>ca', vim.lsp.buf.code_action)

	-- Hover documentation
	map('K', vim.lsp.buf.hover)

	-- Go to declaration
	map('gD', vim.lsp.buf.declaration)

	-- Autocommand to highlight references of the current word when the cursor is resting
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.documentHighlightProvider then
	  local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
	  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
	    buffer = event.buf,
	    group = highlight_augroup,
	    callback = vim.lsp.buf.document_highlight,
	  })

	  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
	    buffer = event.buf,
	    group = highlight_augroup,
	    callback = vim.lsp.buf.clear_references,
	  })

	  vim.api.nvim_create_autocmd('LspDetach', {
	    group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
	    callback = function(event2)
	      vim.lsp.buf.clear_references()
	      vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
	    end,
	  })
	end

	-- Enable inlay hints by default
	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
	  vim.lsp.inlay_hint.enable(true)
	end
      end
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {}

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_intalled = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
	function(server_name)
	  local server = servers[server_name] or {}
	  -- This handles overriding only values explicitly passed
	  -- by the server configuration above. Useful when disabling
	  -- certain features of an LSP (for example, turning off formatting for tsserver)
	  server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
	  require('lspconfig')[server_name].setup(server)
	end,
      },
    }
  end
}

