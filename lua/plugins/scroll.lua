return {
	"karb94/neoscroll.nvim",
	opts = {},
	config = function()
		require("neoscroll").setup({
			hide_cursor = false,
			stop_eof = true,
			duration_multiplier = 0.3,
		})
	end,
}
