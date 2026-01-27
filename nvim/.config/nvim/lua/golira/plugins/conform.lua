return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			python = { "isort", "black" },

			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },

			terraform = { "terraform_fmt" },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
