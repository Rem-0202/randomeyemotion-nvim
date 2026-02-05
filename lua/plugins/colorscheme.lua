return {
	{

		"catppuccin/nvim",
		name = "Catppuccin",
		config = function()
			require("catppuccin").setup({
				default_integrations = true,
				integrations = {
					blink_cmp = true,
				},
				auto_integrations = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "Rose Pine",
	},
	{
		"sainnhe/gruvbox-material",
		name = "Gruvbox Material",
	},
}
