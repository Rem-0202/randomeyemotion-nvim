return {
	"saghen/blink.cmp",

	version = "1.*",
	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
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
	config = function()
		local blink = require("blink.cmp")
		blink.setup()

		-- Apply blink completion capabilities to all servers
		local caps = blink.get_lsp_capabilities()
		for _, cfg in pairs(vim.lsp.config) do
			cfg.capabilities = caps
		end
	end,
}
