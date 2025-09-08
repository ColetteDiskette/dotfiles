return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open Trouble diagnostics" },
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open Trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open Trouble location list" },
	},
}
