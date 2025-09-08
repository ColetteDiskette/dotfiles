return {
	"ethanholz/nvim-lastplace",
	config = function()
		require("nvim-lastplace").setup({
			lastplace_ignore_buftypes = { "quickfix", "nofile", "help" }, -- Avoid restoring in these buffer types
			lastplace_ignore_filetypes = { "gitcommit" }, -- Avoid restoring in these filetypes
			lastplace_open_folds = true, -- Automatically open folds at the last place
		})
	end,
}
