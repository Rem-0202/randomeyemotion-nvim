-- plugins/lsp.lua
return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({ auto_setup = true })

			-- Optional global default config for all servers
			vim.lsp.config("*", {
				root_markers = { ".git", "src", "Makefile" },
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			})
		end,
	},
}
