return {
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("conform").setup({
				-- Example: specify your preferred formatters per filetype
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					python = { "black", "isort" },
				},
				-- Optional: format on save
				format_on_save = {
					timeout_ms = 1000,
					async = false,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
		config = function()
			require("mason-conform").setup({
				-- You can ignore certain formatters if you like
				ignore_install = { "prettier" },
			})
		end,
	},
}
