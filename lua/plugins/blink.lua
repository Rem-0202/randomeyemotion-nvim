return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Esc>"] = { "hide", "fallback" },
			["<PageUp>"] = { "scroll_documentation_up", "fallback" },
			["<PageDown>"] = { "scroll_documentation_down", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "rounded",
				},
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			menu = {
				border = "rounded",
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust" },
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		local blink = require("blink.cmp")
		blink.setup(opts)

		-- Apply blink completion capabilities to all servers
		local caps = blink.get_lsp_capabilities()
		for _, cfg in pairs(vim.lsp.config) do
			cfg.capabilities = caps
		end
	end,
}
