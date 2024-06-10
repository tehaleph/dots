local mason = require("mason")
local masonlspconfig = require("mason-lspconfig")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	PATH = "skip"
})

masonlspconfig.setup()
