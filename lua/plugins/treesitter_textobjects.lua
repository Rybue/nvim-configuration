require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
			["@class.outer"] = "V",
		},
		include_surrounding_whitespace = false,
	},
	move = {
		set_jumps = true,
	},
})

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")
local swap = require("nvim-treesitter-textobjects.swap")

local function sel(query)
	return function()
		select.select_textobject(query, "textobjects")
	end
end

-- Select
vim.keymap.set({ "x", "o" }, "af", sel("@function.outer"), { desc = "a function" })
vim.keymap.set({ "x", "o" }, "if", sel("@function.inner"), { desc = "inner function" })
vim.keymap.set({ "x", "o" }, "ac", sel("@class.outer"), { desc = "a class" })
vim.keymap.set({ "x", "o" }, "ic", sel("@class.inner"), { desc = "inner class" })
vim.keymap.set({ "x", "o" }, "aa", sel("@parameter.outer"), { desc = "a parameter" })
vim.keymap.set({ "x", "o" }, "ia", sel("@parameter.inner"), { desc = "inner parameter" })
vim.keymap.set({ "x", "o" }, "ai", sel("@conditional.outer"), { desc = "a conditional" })
vim.keymap.set({ "x", "o" }, "ii", sel("@conditional.inner"), { desc = "inner conditional" })

-- Move (uppercase C avoids gitsigns ]c/[c)
vim.keymap.set({ "n", "x", "o" }, "]f", function()
	move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function start" })
vim.keymap.set({ "n", "x", "o" }, "]F", function()
	move.goto_next_end("@function.outer", "textobjects")
end, { desc = "Next function end" })
vim.keymap.set({ "n", "x", "o" }, "[f", function()
	move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Prev function start" })
vim.keymap.set({ "n", "x", "o" }, "[F", function()
	move.goto_previous_end("@function.outer", "textobjects")
end, { desc = "Prev function end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function()
	move.goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class" })
vim.keymap.set({ "n", "x", "o" }, "[C", function()
	move.goto_previous_start("@class.outer", "textobjects")
end, { desc = "Prev class" })
vim.keymap.set({ "n", "x", "o" }, "]a", function()
	move.goto_next_start("@parameter.inner", "textobjects")
end, { desc = "Next parameter" })
vim.keymap.set({ "n", "x", "o" }, "[a", function()
	move.goto_previous_start("@parameter.inner", "textobjects")
end, { desc = "Prev parameter" })

-- Swap parameters
vim.keymap.set("n", "<leader>a", function()
	swap.swap_next("@parameter.inner")
end, { desc = "Swap param with next" })
vim.keymap.set("n", "<leader>A", function()
	swap.swap_previous("@parameter.inner")
end, { desc = "Swap param with previous" })
