return {
	"nvim-mini/mini.move",
	version = false,
	config = function()
		require("mini.move").setup({
			mappings = {
				line_left = "",
				line_right = "",
				line_down = "",
				line_up = "",
				left = "<C-h>",
				right = "<C-l>",
				down = "<C-j>",
				up = "<C-k>",
			},
		})
	end,
}
