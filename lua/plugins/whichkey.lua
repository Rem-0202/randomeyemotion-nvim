return {
	"folke/which-key.nvim",
    opts = {
        preset = "helix",
    },
	config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
    end,
}
