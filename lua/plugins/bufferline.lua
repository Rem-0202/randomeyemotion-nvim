return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			highlights = require("bufferline").highlights, -- use theme defaults
			options = {
				mode = "buffers", -- only buffers
				show_tab_indicators = false,
				show_close_icon = false,
				show_buffer_close_icons = true,
				separator_style = "slant",
				always_show_bufferline = false,
				themable = true,
				persist_buffer_sort = true,
				enforce_regular_tabs = false,
				exclude_ft = { "NvimTree", "qf", "toggleterm" },
				numbers = "none",
				view = "multiwindow", -- unique buffers across splits			view = "multiwindow",
				custom_filter = function(buf_number)
					local buftype = vim.bo[buf_number].buftype
					-- hide quickfix
					if buftype == "quickfix" then
						return false
					end
					return true
				end,
			},
		})
	end,
}
