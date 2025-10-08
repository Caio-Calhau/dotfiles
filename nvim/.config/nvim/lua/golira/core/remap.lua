vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "<Leader>w", function()
	require("conform").format({ bufnr = 0 })
	vim.cmd("write")
end)
vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- greatest remap ever
-- Paste over selected text without losing the current clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard (works in normal and visual mode)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Copy whole line to system clipboard (normal mode)
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without copying to clipboard (normal and visual mode)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ bufnr = 0 })
end)

-- Disable the default 'Q' command (used for Ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- Jump to next item in quickfix list and center the screen
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Jump to previous item in quickfix list and center the screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Jump to next item in location list and center the screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Jump to previous item in location list and center the screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace the word under cursor (with confirmation/editing)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

