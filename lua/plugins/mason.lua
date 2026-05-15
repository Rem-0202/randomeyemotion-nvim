return {
	-- LSP + Mason
	{
		"mason-org/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				automatic_installation = true,
			})

			-- Attach navic (if installed) when an LSP attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					-- only attach navic if the server supports symbols
					if client.server_capabilities and client.server_capabilities.documentSymbolProvider then
						local ok, navic = pcall(require, "nvim-navic")
						if ok then
							navic.attach(client, args.buf)
						end
					end
				end,
			})
		end,
	},

	-- Conform + mason-bridge (formatters)
	{
		"stevearc/conform.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"frostplexx/mason-bridge.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-bridge").setup({})

			local conform = require("conform")
			conform.setup({}) -- start empty

			-- 2) Defer applying formatters_by_ft until mason-bridge has populated its cache
			vim.schedule(function()
				local fmts = require("mason-bridge").get_formatters()
				-- apply mapping after it's available
				conform.setup({ formatters_by_ft = fmts })
			end)
		end,
	},

	-- Navic UI (optional)
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			lsp = { auto_attach = true },
		},
	},
}
