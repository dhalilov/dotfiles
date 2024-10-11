return {
  "whonore/Coqtail",
  config = function()
    -- Avoid insert mode bindings clashing with other bindings
    vim.g.coqtail_noimap = 1
  end
}
