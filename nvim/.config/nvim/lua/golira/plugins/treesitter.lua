return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup()

		require("nvim-treesitter.install").install({
			"vimdoc",
			"javascript",
			"typescript",
			"lua",
			"jsdoc",
			"bash",
			"python",
			"css",
			"html",
			"json",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown" },
			callback = function(args)
				vim.treesitter.stop(args.buf)
			end,
		})
	end,
}
