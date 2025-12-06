return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio", -- required by dap-ui
	},
	config = function()
		-- Mason setup
		require("mason").setup()

		-- Mason DAP integration: auto-register all installed adapters
		require("mason-nvim-dap").setup({
			automatic_setup = true, -- automatically sets up all supported DAP servers
			automatic_installation = true, -- auto install if missing
			handlers = {}, -- custom handlers if you want to tweak any adapter
		})

		vim.cmd([[highlight DapRedDot guifg=#FF0000 guibg=NONE]])
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapRedDot", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Debug", linehl = "Visual", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "✖", texthl = "Error", linehl = "", numhl = "" })

		local dap = require("dap")
		local dapui = require("dapui")

		-- DAP UI setup with watches
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.35 },
						{ id = "breakpoints", size = 0.15 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			floating = { border = "rounded", max_height = 0.9, max_width = 0.5 },
			controls = { enabled = true },
		})

		-- Auto open/close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
