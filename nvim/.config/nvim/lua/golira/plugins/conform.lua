return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			python = { "ruff" },

			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },

			terraform = { "terraform_fmt" },

			ruby = { "rubocop" },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
