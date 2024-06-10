return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vim", "go", "rust", "toml", "markdown", "markdown_inline"},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
