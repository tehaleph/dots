local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local cmp = require('cmp')

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" } 
	})
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.golangci_lint_ls.setup{}

lspconfig.gopls.setup{
	capabilities = capabilities,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		}
	}
}


