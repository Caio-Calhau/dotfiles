return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "tabs",
			},
		},
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true, -- only applies to coc
		diagnostics_update_on_event = true, -- use nvim's diagnostic handler

		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					style_preset = {
						bufferline.style_preset.no_italic,
						bufferline.style_preset.no_bold,
					},
				},
			})
		end,
	},

	{
		"tiagovla/scope.nvim",

		config = function()
			vim.keymap.set("n", ">", "<CMD>bnext<CR>")
			vim.keymap.set("n", "<", "<CMD>bprev<CR>")
		end,
	},
}
