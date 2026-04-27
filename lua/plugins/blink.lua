require("blink.cmp").setup({
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = true },
	},

	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },

	-- don't trigger inside snacks pickers / input prompts
	enabled = function()
		return not vim.tbl_contains({ "snacks_picker_input", "snacks_input" }, vim.bo.filetype)
	end,
})
