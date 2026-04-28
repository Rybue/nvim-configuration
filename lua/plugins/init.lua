vim.pack.add({
	-- LSP server management (Mason)
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	-- Keybinding helper
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/folke/which-key.nvim" },
	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- UI / pickers / input
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	-- Completion
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
	-- Colorschemes
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/webhooked/kanso.nvim" },
})

-- INFO: colorscheme
require("plugins.catppuccin")
vim.cmd.colorscheme("catppuccin")

require("plugins.mini_icons")
require("plugins.lualine")
require("plugins.which-key")
require("plugins.gitsigns")
require("plugins.undotree")
require("plugins.snacks")
require("plugins.lazydev")
require("plugins.treesitter")
require("plugins.blink")
