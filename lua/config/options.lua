local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.incsearch = true
opt.hlsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.history = 500
opt.scrolloff = 7
opt.ruler = true
opt.cmdheight = 0
opt.magic = true
opt.matchtime = 2
opt.errorbells = false
opt.visualbell = false
opt.timeoutlen = 500
opt.foldcolumn = "1"
opt.linebreak = true
opt.textwidth = 500
opt.autoindent = true
opt.smartindent = true
opt.wrap = true
opt.updatetime = 500
opt.termguicolors = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.laststatus = 3

vim.diagnostic.config({
	virtual_lines = { current_line = true, severity = vim.diagnostic.severity.ERROR },
	underline = true,
	update_in_insert = false,
})
