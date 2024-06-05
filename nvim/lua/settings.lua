-- 
-- Global Neovim settings
--

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable Nerd Font
vim.g.have_nerd_font = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable mode 
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Smart case-insensitive search (unless uppercase is entered)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Live substitutions
vim.opt.inccommand = 'split'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Set signcolumn 
vim.opt.signcolumn = 'yes'

-- Decrease update time on swap file
vim.opt.updatetime = 250

-- Number of lines to keep above and below cursor
vim.opt.scrolloff = 10

--[[
  Tabs
--]]

-- Width of tabs
vim.opt.shiftwidth = 2

