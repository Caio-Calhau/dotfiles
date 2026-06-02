return {
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		config = function()
			require("smart-splits").setup()

			local function notify_tmux(enter)
				if vim.env.TMUX then
					local cmd = enter
						and { "tmux", "set-option", "-p", "@pane-is-vim", "1" }
						or { "tmux", "set-option", "-p", "-u", "@pane-is-vim" }
					vim.fn.jobstart(cmd)
				end
			end

			vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, { callback = function() notify_tmux(true) end })
			vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, { callback = function() notify_tmux(false) end })

			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
		end,
	},
}
