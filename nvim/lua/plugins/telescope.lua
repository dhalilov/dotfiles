return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',

		-- Faster alternative to find
		'sharkdp/fd',

		-- Native fzf port for maximum performance
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

		-- Cache the result of "git rev-parse"
		local is_inside_work_tree = {}

		-- Fuzzy find based on filename
		-- If inside a Git project, lists only tracked Git files and respects the .gitignore
		vim.keymap.set('n', '<C-p>', function ()
			local cwd = vim.fn.getcwd()

			-- Check if the current directory is a Git project
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is_inside_work_tree")
				is_inside_work_tree[cwd] = vim.v.shell_error == 0
			end

			if is_inside_work_tree[cwd] then
				builtin.git_files()
			else
				builtin.find_files()
			end
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

		-- TODO: Setup Vim pickers

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
