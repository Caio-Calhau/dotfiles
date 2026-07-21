return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		config = function()
			require("rose-pine").setup({
				disable_background = false,
				styles = {
					italic = false,
				},
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			require("catppuccin").setup({
				flavor = "mocha",
				no_italics = true,
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				styles = {
					functions = { italic = false },
					comment = { italic = false },
					keyword = { italic = false },
					variable = { italic = false },
					constant = { italic = false },
					string = { italic = false },
					number = { italic = false },
					boolean = { italic = false },
					constructor = { italic = false },
					type = { italic = false },
				},
			})

			vim.cmd("colorscheme rose-pine")
		end,
	},
}
