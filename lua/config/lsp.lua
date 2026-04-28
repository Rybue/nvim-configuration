-- LSP servers installed via Mason and enabled below
local lsp_servers = {
	"basedpyright",
	"ruff",
	"lua_ls",
	"ts_ls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
	automatic_enable = false,
})

-- Completion capabilities come from blink.cmp (snippets, resolve, etc.)
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable(lsp_servers)

-- Buffer-local LSP keymaps. Only map actions supported by the attached server.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		local function supports(method)
			return client:supports_method(method, ev.buf)
		end

		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
		end

		local function source_action(kind)
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { kind },
					diagnostics = {},
				},
			})
		end

		map("n", "<leader>le", function()
			vim.diagnostic.open_float({ scope = "line" })
		end, "Line diagnostics")
		map("n", "<leader>ld", function()
			Snacks.picker.diagnostics_buffer()
		end, "Buffer diagnostics")
		map("n", "<leader>ll", function()
			Snacks.picker.loclist()
		end, "Location list")
		map("n", "<leader>lq", function()
			Snacks.picker.qflist()
		end, "Quickfix list")

		if supports("textDocument/signatureHelp") then
			map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
		end

		if supports("textDocument/formatting") then
			map("n", "<leader>lf", function()
				vim.lsp.buf.format({ bufnr = ev.buf, async = true })
			end, "Format buffer")
		end

		if supports("textDocument/codeAction") then
			map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
			map("n", "<leader>li", function()
				source_action("source.organizeImports")
			end, "Organize imports")
			map("n", "<leader>lF", function()
				source_action("source.fixAll")
			end, "Fix all")
		end

		if supports("textDocument/definition") then
			map("n", "gd", function()
				Snacks.picker.lsp_definitions()
			end, "Go to definition")
		end

		if supports("textDocument/declaration") then
			map("n", "gD", function()
				Snacks.picker.lsp_declarations()
			end, "Go to declaration")
		end

		if supports("textDocument/references") then
			map("n", "grr", function()
				Snacks.picker.lsp_references()
			end, "References")
		end

		if supports("textDocument/implementation") then
			map("n", "gri", function()
				Snacks.picker.lsp_implementations()
			end, "Go to implementation")
		end

		if supports("textDocument/typeDefinition") then
			map("n", "grt", function()
				Snacks.picker.lsp_type_definitions()
			end, "Go to type definition")
		end

		if supports("textDocument/documentSymbol") then
			map("n", "<leader>ss", function()
				Snacks.picker.lsp_symbols()
			end, "LSP symbols")
		end

		if supports("workspace/symbol") then
			map("n", "<leader>sS", function()
				Snacks.picker.lsp_workspace_symbols()
			end, "LSP workspace symbols")
		end
	end,
})

-- highlight other references to the symbol under the cursor
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client or not client:supports_method("textDocument/documentHighlight") then
			return
		end

		local buf_group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. ev.buf, { clear = true })

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = buf_group,
			buffer = ev.buf,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = buf_group,
			buffer = ev.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end,
})
