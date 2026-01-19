return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd("colorscheme catppuccin-frappe")
		require("catppuccin").setup({
			default_integrations = true,
			integrations = {
				blink_cmp = true,
			},
			auto_integrations = false,
		})
	end,
}
