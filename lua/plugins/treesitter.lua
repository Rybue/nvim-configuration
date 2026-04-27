local parsers = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"python",
	"typescript",
	"tsx",
	"javascript",
	"markdown",
	"markdown_inline",
	"json",
	"yaml",
	"toml",
	"bash",
}

require("nvim-treesitter.config").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install(parsers)

-- start treesitter on any buffer whose filetype has an installed parser
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
