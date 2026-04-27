-- enable true color support
vim.opt.termguicolors = true

-- enable line numbers
vim.opt.number = true

-- sync clipboard between OS and neovim
-- see `:help 'clipboard'`
-- vim.opt.clipboard = "unnamedplus"

-- save undo history
vim.opt.undofile = true
-- maximum number of changes that can be undone
vim.opt.undolevels = 10000

-- keep signcolumn on by default
-- for git signs, diagnostics symbols etc
vim.opt.signcolumn = "yes"

-- show some whitespace characters as symbols
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- enable live preview of substitutions
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- keep 8 lines above/below cursor when scrolling
vim.opt.scrolloff = 8

-- case-insensitive search, but case-sensitive if an uppercase letter is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- enable break indent
vim.opt.breakindent = true

-- enable line wrapping
vim.opt.wrap = true

-- open new splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Number of spaces that a <Tab> character represents
vim.opt.tabstop = 2
-- Number of spaces to use for each step of automatic indentation
vim.opt.shiftwidth = 2
-- Number of spaces that a <Tab> counts for during editing operations
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- faster CursorHold / gitsigns / LSP highlight updates (default 4000ms)
vim.opt.updatetime = 250
-- shorter wait for leader chords and which-key popup (default 1000ms)
vim.opt.timeoutlen = 300

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	-- virtual_text = true, -- show inline diagnostics
	virtual_lines = { current_line = true },
})

-- avoid "Pattern not found" and similar completion messages
vim.opt.shortmess:prepend("c")

-- New UI opt-in
local has_ui2, ui2 = pcall(require, "vim._core.ui2")
if has_ui2 and type(ui2.enable) == "function" then
	ui2.enable({})
end
