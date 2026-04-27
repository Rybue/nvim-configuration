-- set space as <leader> and <localleader> key
-- must be defined before any plugins, otherwise it would use default
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.fn.has("nvim-0.12") == 0 then
	error("This configuration requires Neovim 0.12 or newer")
end

require("config.options")
require("plugins")
require("config.lsp")
require("config.keymaps")
