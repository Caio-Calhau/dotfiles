return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = true,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"lua_ls",
						"pyright",
						"ruff",
						"ts_ls",
						"html",
						"terraformls",
						"yamlls",
						"ruby_lsp",
					},
				},
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = true,
				float = {
					border = "rounded",
					source = "always",
				},
			})

			local servers = {
				"lua_ls",
				"pyright",
				"ruff",
				"ts_ls",
				"html",
				"terraformls",
				"yamlls",
				"ruby_lsp",
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
			end

			local util = require("lspconfig.util")
			local python_root = function(fname)
				return util.root_pattern(".git")(fname) or util.root_pattern("pyproject.toml")(fname)
			end

			vim.lsp.config("pyright", {
				root_dir = python_root,
			})

			vim.lsp.config("ruff", {
				root_dir = python_root,
			})

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
