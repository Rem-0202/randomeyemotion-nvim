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
opt.foldmethod = "manual"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.laststatus = 3

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
	underline = true, -- optional
	update_in_insert = false,
	float = {
		border = "rounded",
		source = "if_many",
		severity_sort = true,
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.wrap = false
	end,
})

function _G.qf_text_dynamic_align(info)
	local items
	if info.quickfix == 1 then
		items = vim.fn.getqflist({ id = info.id, items = 0 }).items
	else
		items = vim.fn.getloclist(info.winid, { id = info.id, items = 0 }).items
	end

	-- get the quickfix window width explicitly
	local qf_win = vim.fn.getqflist({ winid = 0 }).winid
	local win_width = qf_win > 0 and vim.api.nvim_win_get_width(qf_win) or 80

	local lines = {}
	for i = info.start_idx, info.end_idx do
		local e = items[i]
		if e.valid == 1 then
			local text = e.text or ""
			local lnum = e.lnum or 0
			local col = e.col or 0
			local fname = (e.bufnr > 0 and vim.fn.bufname(e.bufnr)) or "[No Name]"

			local right = string.format("|%d col %d|%s", lnum, col, fname)
			local right_w = vim.fn.strdisplaywidth(right)

			-- leave 1 column safety margin to prevent wrapping
			local max_text_w = math.max(win_width - right_w - 1, 0)

			if vim.fn.strdisplaywidth(text) > max_text_w then
				if max_text_w > 1 then
					text = vim.fn.strcharpart(text, 0, max_text_w - 1) .. "…"
				else
					text = ""
				end
			end

			local pad = max_text_w - vim.fn.strdisplaywidth(text)
			text = text .. string.rep(" ", math.max(pad, 0))

			lines[#lines + 1] = text .. right
		else
			lines[#lines + 1] = e.text or ""
		end
	end

	return lines
end

vim.o.quickfixtextfunc = "v:lua.qf_text_dynamic_align"
