local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local cmp = require('cmp')

local border = "rounded"

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
 	},
	sources = cmp.config.sources(
		{
			{ name = "nvim_lsp" }
		},
		{
			{ name = "buffer" }
		}
	),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
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
	capabilities = capabilities,
	root_dir = function(fname)
		return util.root_pattern('go.work', 'go.mod', '.git')(fname)
	end,
}


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = border
  }
)
