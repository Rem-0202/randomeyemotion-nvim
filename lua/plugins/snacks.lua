return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = false },
		notify = { enabled = false },
		picker = {
			enabled = true,
			layout = "telescope",
			---@class snacks.picker.formatters.Config
			formatters = {
				file = {
					filename_first = true, -- display filename before the file path
				},
			},
			---@class snacks.picker.previewers.Config
			previewers = {
				git = {
					native = true, -- use native (terminal) or Neovim for previewing git diffs and commits
					cmd = { "delta " },
				},
			},
			---@class snacks.picker.icons.Config
			icons = {
				files = {
					enabled = false, -- show file icons
				},
			},
			sources = {
				lines = {
					layout = {
						preset = "telescope",
					},
				},
			},
		},
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = true },
		zen = { enabled = false },
		dim = { enabled = false },
		git = { enabled = false },
		gh = { enabled = false },
		keymap = { enabled = true },
	},
}
