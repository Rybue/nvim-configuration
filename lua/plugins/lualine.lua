vim.opt.laststatus = 3
vim.opt.showmode = false

local function lsp_clients()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	local names = vim.tbl_map(function(client)
		return client.name
	end, clients)

	table.sort(names)

	return table.concat(names, ", ")
end

local function has_lsp_clients()
	return #vim.lsp.get_clients({ bufnr = 0 }) > 0
end

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {
				"snacks_dashboard",
				"snacks_picker_input",
			},
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(mode)
					return mode:sub(1, 1)
				end,
			},
		},
		lualine_b = {
			{ "branch", icon = "" },
			{
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = {
					modified = "●",
					readonly = "",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = "󰌵 ",
				},
			},
			{
				lsp_clients,
				icon = "",
				cond = has_lsp_clients,
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = {
			"searchcount",
			"selectioncount",
			"progress",
		},
		lualine_z = {
			"location",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ "filename", path = 1 },
		},
		lualine_x = {
			"location",
		},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {
		"man",
		"quickfix",
	},
})
