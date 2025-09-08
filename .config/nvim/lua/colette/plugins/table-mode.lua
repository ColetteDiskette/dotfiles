return {
	"dhruvasagar/vim-table-mode",
	config = function()
		vim.g.table_mode_corner = "|"
		vim.g.table_mode_header_fillchar = "-"

		-- Keybind to toggle Table Mode
		vim.keymap.set("n", "<leader>Tm", "<cmd>TableModeToggle<CR>", { desc = "Toggle Table Mode" })
	end,
}
