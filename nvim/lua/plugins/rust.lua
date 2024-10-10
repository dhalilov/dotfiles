return {
  'rust-lang/rust.vim',
  on_attach = function(_, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  config = function ()
    require('lspconfig').rust_analyzer.setup {
      settings = {
	['rust-analyzer'] = {
	  imports = {
	    granularity = {
	      group = "module",
	    },
	    prefix = "self",
	  },
	  cargo = {
	    buildScripts = {
	      enable = true,
	    }
	  },
	  check = { command = "clippy" },
	  diagnostics = { enable = true },
	  procMacro = {
	    enable = true
	  }
	}
      }
    }
  end
}

