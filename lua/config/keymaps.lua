vim.g.mapleader = " "
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		local map = require("snacks").keymap.set
		-- Normal mode: splits --
		map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
		map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
		map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
		map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
		map("n", "<C-S-h>", "<C-w><", { desc = "Increase Width" })
		map("n", "<C-S-l>", "<C-w>>", { desc = "Decrease Width" })
		map("n", "<C-S-k>", "<C-w>+", { desc = "Increase Height" })
		map("n", "<C-S-j>", "<C-w>-", { desc = "Decrease Height" })

		-- Insert mode: splits --
		map("i", "<C-h>", "<Esc><C-w>h", { desc = "Move to left split" })
		map("i", "<C-j>", "<Esc><C-w>j", { desc = "Move to below split" })
		map("i", "<C-k>", "<Esc><C-w>k", { desc = "Move to above split" })
		map("i", "<C-l>", "<Esc><C-w>l", { desc = "Move to right split" })

		-- Clear search highlight --
		map("n", "<Leader><CR>", "<cmd>noh<CR>", { silent = true }, { desc = "Clear search highlight" })

		-- File tree --
		map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { silent = true }, { desc = "Toggle file tree" })

		-- Basic file ops --
		map("n", "<leader>w", "<cmd>w<CR>", { silent = true }, { desc = "Save file" })
		map("n", "<leader>q", "<cmd>q<CR>", { silent = true }, { desc = "Quit file" })
		map("n", "<leader>Q", "<cmd>q!<CR>", { silent = true }, { desc = "Quit without saving" })

		-- Increment / Decrement numbers --
		map("n", "<leader>+", "<C-a>", { silent = true }, { desc = "Increment number" })
		map("n", "<leader>_", "<C-x>", { silent = true }, { desc = "Decrement number" })

		-- Prevent delete from yanking --
		map("n", "d", '"_d', { silent = true })
		map("v", "d", '"_d', { silent = true })
		map("n", "c", '"_c', { silent = true })
		map("v", "c", '"_c', { silent = true })
		map("n", "x", '"_x', { silent = true })
		map("v", "x", '"_x', { silent = true })
		map("n", "<leader>d", "d", { silent = true }, { desc = "Delete with yank" })
		map("v", "<leader>d", "d", { silent = true }, { desc = "Delete with yank" })

		-- Scrolling --
		map("n", "<PageDown>", "<C-d>", { silent = true })
		map("n", "<PageUp>", "<C-u>", { silent = true })

		-- Movement --
		map("n", "j", function()
			return vim.v.count == 0 and "gj" or "j"
		end, { expr = true })

		map("n", "k", function()
			return vim.v.count == 0 and "gk" or "k"
		end, { expr = true })

		-- Tabs --
		map("n", "<M-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true }, { desc = "Next buffer" })
		map("n", "<M-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true }, { desc = "Previous buffer" })
		map("i", "<M-l>", "<ESC><cmd>bn<CR>", { silent = true }, { desc = "Next buffer" })
		map("i", "<M-h>", "<ESC><cmd>bp<CR>", { silent = true }, { desc = "Previous buffer" })
		map("n", "<leader><C-w>", "<cmd>bd<CR>", { silent = true }, { desc = "Close buffer" })

		-- Latex --
		map({ "n", "v", "i" }, "<F5>", function()
			require("knap").toggle_autopreviewing()
		end, { desc = "Knap autopreview", ft = { "tex" } })
		map({ "n", "v", "i" }, "<F6>", function()
			require("knap").close_viewer()
		end, { desc = "Close preview", ft = { "tex" } })

		-- Markdown --
		map("n", "<F5>", function()
			require("render-markdown").toggle()
		end, { desc = "Toggle RenderMarkdown", ft = { "markdown" } })

		-- Make
		map("n", "<leader>m", "<Cmd>MakeitOpen<CR>", { desc = "Run Make" })

		-- LSP --

		map("n", "grd", vim.lsp.buf.definition, { silent = true }, { desc = "Goes to the definition" })
		map("n", "<leader>h", vim.lsp.buf.hover, { silent = true }, { desc = "Show help" })
		map("n", "<leader>rn", vim.lsp.buf.rename, { silent = true }, { desc = "Renames a symbol" })
		map("n", "<leader>fm", vim.lsp.buf.format, { silent = true }, { desc = "Format file" })
		map("n", "<leader>tr", "<Cmd>Trouble<CR>", { silent = true }, { desc = "Show diagnostics" })
		map("n", "<leader>df", function()
			vim.diagnostic.open_float(nil, { focus = false })
		end, { desc = "Open diagnostic float" })

		-- Quickfix list --
		map("n", "<leader>cn", "<Cmd>cn<CR>", { silent = true }, { desc = "Next quick fix list item" })
		map("n", "<leader>cp", "<Cmd>cp<CR>", { silent = true }, { desc = "Previous quick fix list item" })
		map("n", "<leader>cq", "<Cmd>cclose<CR>", { silent = true }, { desc = "Close quick fix list" })
		map("n", "q", "<Cmd>q<CR>", { silent = true }, { desc = "Close quick fix list", ft = { "qf" } })

		-- Picker --
		map("n", "<leader>pp", "<Cmd>lua Snacks.picker()<CR>", { silent = true }, { desc = "Open picker" })
		map("n", "<leader>pl", "<Cmd>lua Snacks.picker.lines()<CR>", { silent = true }, { desc = "Lines search" })
		map("n", "<leader>pf", "<Cmd>lua Snacks.picker.files()<CR>", { silent = true }, { desc = "Files Search" })
		map("n", "<leader>pg", "<Cmd>lua Snacks.picker.grep()<CR>", { silent = true }, { desc = "Live Grep" })
		map(
			"n",
			"<leader>pb",
			"<Cmd>lua Snacks.picker.grep_buffers()<CR>",
			{ silent = true },
			{ desc = "Buffers Grep" }
		)
		map(
			"n",
			"<M-q>",
			"<Cmd>lua Snacks.picker.actions.qflist()<CR>",
			{ silent = true },
			{ desc = "Send to quickfix list" }
		)

		-- Outline --
		map("n", "<leader>ol", "<Cmd>Outline<CR>", { silent = true }, { desc = "Toggle Outline" })

		-- Copilot Chat --
		map("n", "<leader>ai", "<Cmd>CopilotChatToggle<CR>", { silent = true }, { desc = "Toggle Copilot Chat" })
	end,
})
