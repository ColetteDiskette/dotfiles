return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lazy_status = require("lazy.status") -- to show pending updates

		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = "catppuccin",
				component_separators = { left = "|", right = "|" },
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#fab387" },
					},
					"encoding",
					"fileformat",
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
