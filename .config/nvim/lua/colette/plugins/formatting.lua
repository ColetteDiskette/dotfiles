return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				bash = { "shfmt", "shellcheck" },
				zsh = { "shfmt", "shellcheck" },
				sh = { "shfmt", "shellcheck" },
			},
			formatters = {
				black = {
					args = { "--line-length", "79", "-" },
					stdin = true,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		-- Keymap for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		-- InsertLeave formatting
		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern = "*",
			callback = function(args)
				conform.format({
					bufnr = args.buf,
					lsp_fallback = true,
					async = true, -- async recommended for insert-leave
				})
			end,
		})
	end,
}
