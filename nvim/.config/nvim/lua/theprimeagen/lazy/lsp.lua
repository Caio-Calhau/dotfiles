return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"stevanmilic/nvim-lspimport",
		"nvimtools/none-ls.nvim",
	},

	run = "make install_jsregexp",

	config = function()
		require("conform").setup({
			formatters_by_ft = {},
		})
		-- local cmp = require("cmp")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.enable({
			"luals",
			"pyright",
			"emmet_ls",
			"jsonls",
			"tsserver",
			"cssls",
			"html",
			"yamlls",
			"tailwindcss",
			"svelte",
		})

		vim.lsp.enable("eslint", {
			cmd = { "eslint_d", "vscode-eslint-language-server", "--stdio" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		})

		vim.diagnostic.config({
			update_in_insert = true,
			virtual_text = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.prettier,
			},
		})

		require("lspconfig").eslint.setup({
			settings = {
				workingDirectories = {
					mode = "auto",
				},
			},
		})

		require("fidget").setup({})
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"luacheck",
				"shellcheck",
				"shfmt",
				"prettierd",
				"prettier",
				"eslint_d",
				"eslint",
				"jsonlint",
				"yamllint",
				"markdownlint",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"emmet_ls",
				"pyright",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								format = {
									enable = true,
									-- Put format options here
									-- NOTE: the value should be STRING!!
									defaultConfig = {
										indent_style = "space",
										indent_size = "2",
									},
								},
							},
						},
					})
				end,

				["emmet_ls"] = function()
					local lspconfig = require("lspconfig")
					-- configure emmet language server
					lspconfig["emmet_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"javascript",
							"typescript",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,
			},
		})
	end,
}
