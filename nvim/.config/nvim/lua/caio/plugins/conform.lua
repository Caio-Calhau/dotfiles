return {

	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile", "BufWritePre" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				html = { "htmlbeautifier" },
				css = { "prettierd", "prettier" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
