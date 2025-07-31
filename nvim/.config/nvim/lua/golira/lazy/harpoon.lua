return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

	config = function()
		local harpoon = require("harpoon")
		local conf = require("telescope.config")

		harpoon.setup({})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-A-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-A-N>", function()
			harpoon:list():next()
		end)
	end,
}
