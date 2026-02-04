-- plugins/lsp.lua
return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				},
			})
		end,
	},
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
				on_attach = function(client, bufnr)
					require("nvim-navic").attach(client, bufnr)
				end,
			})
		end,
	},
}
