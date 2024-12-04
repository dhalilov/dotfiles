-- `Coqtail` is the plugin that communicates between Coq and Neovim.
-- It allows us to run interactive Coq proofs inside Neovim.
return {
	"whonore/Coqtail",
	config = function()
		-- Avoid insert mode bindings clashing with other bindings
		vim.g.coqtail_noimap = 1
	end
}
