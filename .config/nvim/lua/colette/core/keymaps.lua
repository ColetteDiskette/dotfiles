vim.g.mapleader = " "

local keymap = vim.keymap

---- Scrollwheel cursor movement
--keymap.set("n", "<ScrollWheelUp>", "3k", { desc = "Move cursor up 3 lines with scroll wheel" })
--keymap.set("n", "<ScrollWheelDown>", "3j", { desc = "Move cursor down 3 lines with scroll wheel" })
--keymap.set("v", "<ScrollWheelUp>", "3k", { desc = "Move cursor up 3 lines with scroll wheel (visual mode)" })
--keymap.set("v", "<ScrollWheelDown>", "3j", { desc = "Move cursor down 3 lines with scroll wheel (visual mode)" })

-- Optional: If you want to keep some mouse functionality but disable default scrolling
-- vim.opt.mouse = "n"  -- Enable mouse only in normal mode (prevents insert mode interference)

-- Splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Buffers
-- Close current buffer with prompt, open Alpha if it was the last buffer
local close_buffer = function()
	-- Count listed buffers before deletion
	local buffers_before = vim.fn.getbufinfo({ buflisted = 1 })

	-- Close current buffer with prompt
	vim.cmd("confirm bdelete")

	-- Count listed buffers after deletion
	local buffers_after = vim.fn.getbufinfo({ buflisted = 1 })

	-- If it was the last real buffer and Vim created a new empty one, open Alpha
	if #buffers_before == 1 and #buffers_after == 1 then
		local new_buf = buffers_after[1].bufnr
		if vim.api.nvim_buf_get_name(new_buf) == "" then
			-- Open Alpha
			vim.cmd("Alpha")
			-- Kill the empty buffer
			vim.api.nvim_buf_delete(new_buf, { force = true })
		end
	end
end
-- Map it to both <leader>bc and Ctrl+w
keymap.set("n", "<leader>bc", close_buffer, { desc = "Close buffer" })
keymap.set("n", "<C-w>", close_buffer, { desc = "Close buffer" })

-- Select all text in buffer
-- Normal mode
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all text in buffer" })
-- Insert mode
keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "Select all text in buffer" })
-- Visual mode
keymap.set("v", "<C-a>", "ggVG", { desc = "Select all text in buffer" })

keymap.set("n", "<leader>bN", "<cmd>enew<CR>", { desc = "Open new empty buffer" })
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
