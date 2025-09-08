return {
	"nvim-mini/mini.files",
	version = false,
	lazy = false,
	config = function()
		local minifiles = require("mini.files")
		minifiles.setup({
			options = {
				permanent_delete = false,
			},
			windows = {
				max_number = 3,
				preview = true,
				width_focus = 40,
				width_nofocus = 15,
				width_preview = 35,
			},
		})

		local augroup = vim.api.nvim_create_augroup("MiniFilesKeymaps", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			group = augroup,
			callback = function(args)
				local buf_id = args.data.buf_id

				-- Close
				vim.keymap.set("n", "<Esc>", function()
					minifiles.close()
				end, { buffer = buf_id, nowait = true })
				vim.keymap.set("n", "q", function()
					minifiles.close()
				end, { buffer = buf_id, nowait = true })

				---- Go in
				-- vim.keymap.set("n", "<Right>", function()
				-- 	minifiles.go_in()
				-- end, { buffer = buf_id, nowait = true })
				-- vim.keymap.set("n", "l", function()
				-- 	minifiles.go_in()
				-- end, { buffer = buf_id, nowait = true })

				-- Go in plus
				vim.keymap.set("n", "<CR>", function()
					minifiles.go_in({ close_on_file = true })
				end, { buffer = buf_id, nowait = true })
				vim.keymap.set("n", "<Right>", function()
					minifiles.go_in({ close_on_file = true })
				end, { buffer = buf_id, nowait = true })
				vim.keymap.set("n", "l", function()
					minifiles.go_in({ close_on_file = true })
				end, { buffer = buf_id, nowait = true })

				-- Go out
				vim.keymap.set("n", "<Left>", function()
					minifiles.go_out()
				end, { buffer = buf_id, nowait = true })
				vim.keymap.set("n", "h", function()
					minifiles.go_out()
				end, { buffer = buf_id, nowait = true })

				-- Synchronize
				vim.keymap.set("n", "w", function()
					minifiles.synchronize()
				end, { buffer = buf_id, nowait = true })
				vim.keymap.set("n", "=", function()
					minifiles.synchronize()
				end, { buffer = buf_id, nowait = true })
			end,
		})
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = "Open mini.files (Directory of Current File)",
		},
	},
}
