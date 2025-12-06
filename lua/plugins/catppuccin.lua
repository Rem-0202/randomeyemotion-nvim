return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd("colorscheme catppuccin-frappe")
	end,
	-- require("catppuccin").setup({
	-- 	auto_integrations = true,
	-- }),
}
