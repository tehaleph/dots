return {
	"rebelot/kanagawa.nvim",
	config = function()
		require('kanagawa').setup({
			compile = true,
			transparent = false,
			dimInactive = true,
			theme = 'lotus',
	});
	end
}
