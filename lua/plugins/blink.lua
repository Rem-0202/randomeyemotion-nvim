return {
	"saghen/blink.cmp",

	version = "1.*",
	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",
			["<C-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
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
		completion = { documentation = { auto_show = false } },
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
