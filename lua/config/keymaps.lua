local map = vim.keymap.set

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")

-- Easier window movement
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Diagnostic keymaps
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

-- Editing history
map("n", "<leader>u", "<cmd>Undotree<CR>", { desc = "Toggle undo tree" })

-- Picker keymaps
map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files (Root Dir)" })
map("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>sb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help pages" })
map("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>sr", function()
	Snacks.picker.recent()
end, { desc = "Recent files" })
map("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })

map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })
