return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				-- Python
				"ruff",
				"black",
				"isort",

				-- JS
				"prettier",
				"eslint_d",

				-- Lua
				"stylua",

				-- Terraform
				"terraform",
			},
		},
	},
}
