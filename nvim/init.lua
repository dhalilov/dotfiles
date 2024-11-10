-- Main entry point of NeoVim configuration
--

-- [[ Load settings, keymaps and autocommands ]]
require("settings.init")
require("keymaps.init")
require("autocommands.init")

-- [[ Set up Lazy package manager ]]
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable",
		lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup()

			vim.cmd.colorscheme "catppuccin-latte"
		end
	},

	-- Import all plugins from the plugins directory
	{ import = "plugins" },
})

