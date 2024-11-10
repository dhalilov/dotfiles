-- Global NeoVim settings
--   This file contains global editor settings and customization, such as line
--   numbers, signcolumn, and undo/swap file configuration.

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable Nerd Font
vim.g.have_nerd_font = true

-- [[ Editor options ]]

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

-- [[ Undo and crash recovery ]]

-- Save undo history (make undos persistent across restarts)
vim.opt.undofile = true

-- Decrease update time on swap file (crash recovery)
vim.opt.updatetime = 250
