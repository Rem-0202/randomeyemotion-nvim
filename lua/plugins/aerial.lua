---@diagnostic disable: undefined-global
return {
	"stevearc/aerial.nvim",
	opts = { backend = { "lsp", "treesitter" } },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function(_, opts)
		require("aerial").setup(opts)

		-- Close aerial automatically when quitting the main buffer
		vim.api.nvim_create_autocmd("QuitPre", {
			pattern = "*",
			callback = function()
				local status_ok, aerial = pcall(require, "aerial")
				if status_ok then
					aerial.close()
				end
			end,
		})
	end,
}
