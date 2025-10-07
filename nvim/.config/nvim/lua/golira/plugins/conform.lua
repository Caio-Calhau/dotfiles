return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "pretierd", "prettier" },
				typescript = { "prettierd", "prettier" },
        terraform = { "tflint", "serve" }
			},
		})
	end,
}
