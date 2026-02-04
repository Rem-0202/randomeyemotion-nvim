return {
	"hedyhli/outline.nvim",
	cmd = "Outline",
	opts = function()
		local defaults = require("outline.config").defaults
		local opts = {
			symbols = {
				icons = {},
			},
			keymaps = {
				up_and_jump = "<up>",
				down_and_jump = "<down>",
			},
		}

		for kind, symbol in pairs(defaults.symbols.icons) do
			opts.symbols.icons[kind] = {
				hl = symbol.hl,
			}
		end
		return opts
	end,
}
