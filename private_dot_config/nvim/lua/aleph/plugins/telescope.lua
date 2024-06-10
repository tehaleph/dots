return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim"},
	opts = {
		extensions = {
			cmdline = {
				picker = {
					layout_config = {
						width = 120,
						height = 25,
					},
				},
				mappings = {
					complete = "<Tab>",
					run_selection = "<C-CR>",
					run_input = "<CR>",
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}
