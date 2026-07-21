return {
	"tpope/vim-fugitive",
	config = function()
		local function toggle_fugitive()
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.bo[buf].ft == "fugitive" then
					vim.api.nvim_win_close(win, true)
					return
				end
			end
			vim.cmd("horizontal Git | horizontal resize 15")
		end

		vim.keymap.set("n", "<leader>gs", toggle_fugitive)

		local Golira_Fugitive = vim.api.nvim_create_augroup("Golira_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = Golira_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end
			end,
		})

		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
	end,
}
