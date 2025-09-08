return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			separator_style = "slant",
			custom_filter = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft ~= "vimwiki" then
					return true
				end
				return bufnr == vim.api.nvim_get_current_buf()
			end,
		},
	},
	config = function(_, opts)
		local bufferline = require("bufferline")
		bufferline.setup(opts)

		local function set_bufferline_colors()
			vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#585b70", fg = "#585b70" })
			vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#585b70" })
			vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "#585b70" })
		end

		-- Apply immediately
		set_bufferline_colors()

		-- Reapply on colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = set_bufferline_colors,
		})
	end,
}
