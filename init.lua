require("config.options")
require("config.keymaps")
require("config.lazy")

vim.opt.background = "light"
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_better_performance = 1
vim.cmd("colorscheme gruvbox-material")
