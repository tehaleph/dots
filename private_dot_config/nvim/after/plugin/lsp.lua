local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

coq = require("coq")

lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({
	capabilities = capabilities,
}))

lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
	capabilities = capabilities, settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}))

lspconfig.golangci_lint_ls.setup(coq.lsp_ensure_capabilities({
	capabilities = capabilities,
	root_dir = function(fname)
		return util.root_pattern("go.work", "go.mod", ".git")(fname)
	end,
}))

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = border,
})

require('lspsaga').setup({
	implement = {
		enable = true
	}
})

vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga rename<cr>")
vim.keymap.set("n", "<leader>gs", "<cmd>Lspsaga incoming_calls<cr>")
vim.keymap.set("n", "<leader>gS", "<cmd>Lspsaga outgoing_calls<cr>")
vim.keymap.set("n", "<leader>gpd", "<cmd>Lspsaga peek_definition<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>Lspsaga finder<cr>")
vim.keymap.set({"n", "t"}, "<c-\\>", "<cmd>Lspsaga term_toggle<cr>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
vim.keymap.set("n", "<leader>gi", "<cmd>Lspsaga finder imp<cr>")

