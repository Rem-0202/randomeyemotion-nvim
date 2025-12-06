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
map("n", "<Leader><CR>", "<cmd>noh<CR>", { silent = true })

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

-- Tabs
map("n", "<M-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true }, { desc = "Next buffer" })
map("n", "<M-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true }, { desc = "Previous buffer" })
map("i", "<M-l>", "<ESC><cmd>bn<CR>", { silent = true }, { desc = "Next buffer" })
map("i", "<M-h>", "<ESC><cmd>bp<CR>", { silent = true }, { desc = "Previous buffer" })
map("n", "<leader><C-w>", "<cmd>bd<CR>", { silent = true }, { desc = "Close buffer" })

-- Plugins
map("n", "<F5>", "<Cmd>DapContinue<CR>", { desc = "Start/Continue Debugging" })
map("n", "<leader>b", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
map("n", "<F8>", "<Cmd>DapTerminate<CR>", { desc = "Stop Debugging" })
map("n", "<F10>", "<Cmd>DapStepOver<CR>", { desc = "Step Over" })
map("n", "<F11>", "<Cmd>DapStepInto<CR>", { desc = "Step Into" })
map("n", "<F12>", "<Cmd>DapStepOut<CR>", { desc = "Step Out" })

-- LSP and QF
map("n", "<leader>h", vim.lsp.buf.hover, { silent = true }, { desc = "Show help" })
map("n", "<leader>rn", vim.lsp.buf.rename, { silent = true }, { desc = "Renames a symbol" })
map("n", "<leader>tr", "<Cmd>Trouble<CR>", { silent = true }, { desc = "Show diagnostics" })
map("n", "<leader>cn", "<Cmd>cn<CR>", { silent = true }, { desc = "Next quick fix list item" })
map("n", "<leader>cp", "<Cmd>cp<CR>", { silent = true }, { desc = "Previous quick fix list item" })
map("n", "<leader>cq", "<Cmd>cclose<CR>", { silent = true }, { desc = "Close quick fix list" })
map("n", "<leader>df", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Open diagnostic float" })

map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { silent = true }, { desc = "Open Markdown Preview" })
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
