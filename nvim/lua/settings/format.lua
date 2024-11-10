-- General code formatting settings.
--   Language-specific configuration may be found in the `after/ftplugin/`
--   directory, and/or in the setup function of `conform.nvim`.

-- [[ Indentation and whitespace ]]

local tab_size = 4

-- Number of spaces per tab
vim.opt.tabstop = tab_size

-- Number of spaces per indentation level
vim.opt.shiftwidth = tab_size

-- Always make indent a multiple of `shiftwidth`
vim.opt.shiftround = true

-- Do not convert tabs to spaces
vim.opt.expandtab = false

-- Continue visual indentation on line wrap
vim.opt.breakindent = true

-- Show indent lines, trailing whitespace and non-breakable spaces
vim.opt.list = true
vim.opt.listchars = { tab = "▏ ", trail = '·', nbsp = '␣' }

-- [[ Formatting ]]

-- Add a ruler at 80 characters
vim.opt.colorcolumn = {80}

-- Wrap lines at 80 characters
vim.opt.textwidth = 80

-- Automatically wrap inserted comments
vim.opt.formatoptions:append { 'a' }
