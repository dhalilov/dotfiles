-- Override the tab size for the current Scala buffer. This should also be set
-- by scalafmt, but this is a good fallback to avoid large indentation.

local tab_size = 2
vim.bo.tabstop = tab_size
vim.bo.shiftwidth = tab_size
