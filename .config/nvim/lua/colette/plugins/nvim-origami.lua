return {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	opts = {
		foldtext = {
			lineCount = { template = " %d" },
		},
		foldKeymaps = { setup = false }, -- disable built-in keymaps
	},
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99

		local fold_util = require("colette.utils.code-folds")
		local origami = require("origami")

		-- Setup Origami
		origami.setup({ providers = { "treesitter", "indent" } })

		-- Keymaps
		local keymaps = {
			["<CR>"] = "za",
			["[["] = fold_util.goto_previous_fold,
			["]]"] = "zj",
			h = origami.h,
			l = origami.l,
			["$"] = origami.dollar,
			["<Left>"] = origami.h,
			["<Right>"] = origami.l,
			["<End>"] = origami.dollar,
		}

		for k, v in pairs(keymaps) do
			vim.keymap.set("n", k, v, { noremap = true, silent = true })
		end

		-- Autocmds
		vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "LspAttach" }, {
			callback = function(opts)
				-- Skip fold updates for markdown files
				if vim.bo[opts.buf].filetype == "markdown" then
					return
				end
				fold_util.update_ranges(opts.buf)
			end,
		})

		local last_row
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = function(opts)
				-- Skip fold updates for markdown files
				if vim.bo[opts.buf].filetype == "markdown" then
					return
				end
				local row = vim.api.nvim_win_get_cursor(0)[1]
				if row ~= last_row then
					last_row = row
					fold_util.update_current_fold(row, opts.buf)
				end
			end,
		})

		vim.api.nvim_create_autocmd({ "BufUnload", "BufWipeout" }, {
			callback = function(opts)
				fold_util.clear(opts.buf)
			end,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				if vim.bo.filetype ~= "markdown" then
					vim.opt_local.statuscolumn = "%!v:lua.StatusCol()"
				else
					-- Reset statuscolumn for markdown files
					vim.opt_local.statuscolumn = ""
				end
			end,
		})

		_G.StatusCol = fold_util.statuscol

		-- Markdown-specific: disable folding completely
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				-- Disable folding for markdown
				vim.opt_local.foldenable = false
				vim.opt_local.foldmethod = "manual"
				-- Ensure no folds exist
				vim.cmd("normal! zE")
			end,
		})
	end,
}
