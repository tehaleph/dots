return {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    opts = {
        flavour = "frappe",
	background = {
		dark = "frappe",
		light = "latte",
	},
	transparent_background = false,
	integrations = {
            treesitter_context = true,
            telescope = { enabled = true },
            treesitter = true,
        }
    }
}
