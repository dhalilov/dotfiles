-- Highlights todos, notes, etc. such as the following
-- TODO:
-- NOTE:
-- HACK:
-- BUG: 

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false }
}

