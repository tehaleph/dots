return {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    opts = {
        flavour = "mocha",
	background = {
		dark = "mocha",
		light = "latte",
	},
	transparent_background = true,
	integrations = {
            treesitter_context = true,
            telescope = { enabled = true },
            treesitter = true,
        }
    }
}
