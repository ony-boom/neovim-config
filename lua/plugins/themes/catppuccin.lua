return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			term_colors = true,
			transparent_background = true,
		})
	end,
}
