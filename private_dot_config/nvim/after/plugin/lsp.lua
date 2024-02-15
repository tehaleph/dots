local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
 	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }
	}, {
		{ name = "buffer" }
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}

