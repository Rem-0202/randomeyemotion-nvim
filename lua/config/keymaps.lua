local map = vim.keymap.set
vim.g.mapleader = " "
-- Normal mode: move between splits
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Insert mode: move between splits
map("i", "<C-h>", "<Esc><C-w>h", { desc = "Move to left split" })
map("i", "<C-j>", "<Esc><C-w>j", { desc = "Move to below split" })
map("i", "<C-k>", "<Esc><C-w>k", { desc = "Move to above split" })
map("i", "<C-l>", "<Esc><C-w>l", { desc = "Move to right split" })

-- Clear search highlight
map("n", "<Leader><CR>", "<cmd>noh<CR>", { silent = true }, {desc = "Clear search highlight"})

-- FZF / Telescope shortcuts
map("n", "<leader>f", "<cmd>Telescope find_files theme=dropdown<CR>", { silent = true })
map("n", "<leader>lg", "<cmd>Telescope live_grep theme=dropdown<CR>", { silent = true })
map("n", "<leader>l", "<cmd>Telescope current_buffer_fuzzy_find theme=dropdown<CR>", { silent = true })

-- File tree
map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>")

-- Basic file ops
map("n", "<leader>w", "<cmd>w<CR>", { silent = true })
map("n", "<leader>q", "<cmd>q<CR>", { silent = true })
map("n", "<leader>Q", "<cmd>q!<CR>", { silent = true })

-- Increment / Decrement numbers
map("n", "<leader>+", "<C-a>", { silent = true })
map("n", "<leader>_", "<C-x>", { silent = true })

-- Prevent delete from yanking
map("n", "d", '"_d', { silent = true })
map("v", "d", '"_d', { silent = true })
map("n", "c", '"_c', { silent = true })
map("v", "c", '"_c', { silent = true })
map("n", "x", '"_x', { silent = true })
map("v", "x", '"_x', { silent = true })

map("n", "<leader>d", "d", { silent = true })
map("v", "<leader>d", "d", { silent = true })

-- Scrolling
map("n", "<PageDown>", "<C-d>", { silent = true })
map("n", "<PageUp>", "<C-u>", { silent = true })

-- Movement
map("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true })

map("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true })
-- Tabs
map("n", "<M-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true }, { desc = "Next buffer" })
map("n", "<M-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true }, { desc = "Previous buffer" })
map("i", "<M-l>", "<ESC><cmd>bn<CR>", { silent = true }, { desc = "Next buffer" })
map("i", "<M-h>", "<ESC><cmd>bp<CR>", { silent = true }, { desc = "Previous buffer" })
map("n", "<leader><C-w>", "<cmd>bd<CR>", { silent = true }, { desc = "Close buffer" })

-- Plugins
map({ "n", "v", "i" }, "<F5>", function()
	require("knap").toggle_autopreviewing()
end, { desc = "Knap autopreview" })

map({ "n", "v", "i" }, "<F6>", function()
	require("knap").close_viewer()
end, { desc = "Close preview" })

-- Make
map("n", "<leader>m", "<Cmd>MakeitOpen<CR>", { desc = "Run Make" })

-- LSP and QF

map("n", "grd", vim.lsp.buf.definition, { silent = true }, { desc = "Goes to the definition" })
map("n", "<leader>h", vim.lsp.buf.hover, { silent = true }, { desc = "Show help" })
map("n", "<leader>rn", vim.lsp.buf.rename, { silent = true }, { desc = "Renames a symbol" })
map("n", "<leader>tr", "<Cmd>Trouble<CR>", { silent = true }, { desc = "Show diagnostics" })
map("n", "<leader>cn", "<Cmd>cn<CR>", { silent = true }, { desc = "Next quick fix list item" })
map("n", "<leader>cp", "<Cmd>cp<CR>", { silent = true }, { desc = "Previous quick fix list item" })
map("n", "<leader>cq", "<Cmd>cclose<CR>", { silent = true }, { desc = "Close quick fix list" })
map("n", "<leader>df", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Open diagnostic float" })

map("n", "<leader>a", "", {
	noremap = true,
	silent = true,
	callback = function()
		local status_ok, aerial = pcall(require, "aerial")
		if not status_ok then
			return
		end

		-- Check if any aerial window is already open
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.bo[buf].filetype == "aerial" then
				-- Focus the aerial window
				vim.api.nvim_set_current_win(win)
				return
			end
		end

		-- If not open, toggle aerial
		aerial.toggle()
	end,
}, { desc = "Toggle Entering Aerial" })
