return {
	"romgrk/barbar.nvin",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		require("barbar").setup({

			-- Move to previous/next
			map("n", "<Tab> ", "<Cmd>BufferPrevious<CR>", opts),
			map("n", "<S-Tab>", "<Cmd>BufferNext<CR>", opts),

			-- Re-order to previous/next
			map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts),
			map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts),

			-- Goto buffer in position...
			map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts),
			map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts),
			map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts),
			map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts),
			map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts),
			map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts),
			map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts),
			map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts),
			map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts),
			map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts),

			-- Pin/unpin buffer
			map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts),

			-- Goto pinned/unpinned buffer
			--                 :BufferGotoPinned
			--                 :BufferGotoUnpinned

			-- Close buffer
			map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts),

			-- Wipeout buffer
			--                 :BufferWipeout

			-- Close commands
			--                 :BufferCloseAllButCurrent
			--                 :BufferCloseAllButPinned
			--                 :BufferCloseAllButCurrentOrPinned
			--                 :BufferCloseBuffersLeft
			--                 :BufferCloseBuffersRight

			-- Other:
			-- :BarbarEnable - enables barbar (enabled by default)
			-- :BarbarDisable - very bad command, should never be used
		})
	end,
}
