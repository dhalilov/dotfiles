-- 
-- Global Neovim settings
--

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable Nerd Font
vim.g.have_nerd_font = true

-- [[ Options ]]

-- Show line numbers and enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide current mode 
vim.opt.showmode = false

-- Number of lines to keep above and below cursor
vim.opt.scrolloff = 10

-- Always show signcolumn to avoid displacements
vim.opt.signcolumn = "yes"

-- Highlight current cursor line
vim.opt.cursorline = true

-- Open window split on right/below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Decrease update time on swap file (crash recovery)
vim.opt.updatetime = 250

-- [[ Indentation and whitespace ]]

-- Tab size
vim.opt.tabstop = 2

-- Number of spaces per indent level
vim.opt.shiftwidth = 2

-- Enable smart indentation for C-like code
vim.opt.cindent = true

-- Continue visual indentation on line wrap
vim.opt.breakindent = true

-- Show trailing whitespace and non-breakable spaces
vim.opt.list = true
vim.opt.listchars = { tab = '▏ ', leadmultispace = '▏ ', trail = '·', nbsp = '␣' }

-- [[ Searching and substitutions ]]

-- Smart case-insensitive search (unless uppercase is entered)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Live substitutions in a preview buffer
vim.opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

