return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },

    -- Native FZF port for maximum performance
    { 
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
	return vim.fn.executable 'make' == 1
      end
    },

    -- Make native selectors use Telescope
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Fancy webdev icons
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
  },
  config = function()
    require("telescope").setup {
      extensions = {
	['ui-select'] = {
	  require('telescope.themes').get_dropdown(),
	},
      },
    }

    -- Enable Telescope extensions
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require("telescope.builtin") 

    -- Fuzzy find based on filename
    vim.keymap.set('n', '<C-p>', function()
      builtin.find_files(require('telescope.themes').get_dropdown({}))
    end, {})

    -- Fuzzy find based on text content
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})

    -- Fuzzy find based on word under cursor
    vim.keymap.set('n', '<leader>*', builtin.grep_string, {})

    -- Fuzzy find in current buffer
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	winblend = 10,
	previewer = false,
      })
    end, {})

    -- TODO Setup Vim pickers

    -- Git pickers
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
    
    -- Shortcut for searching in Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, {})
  end
}
