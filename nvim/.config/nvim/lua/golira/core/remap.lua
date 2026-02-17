local function move_and_center_if_at_bottom(cmd)
	-- Executa o movimento ignorando mapeamentos (para evitar recursão)
	vim.cmd("normal! " .. cmd)

	-- Obtém a linha do cursor relativa à janela (1 = topo)
	local cursor_winline = vim.fn.winline()
	local win_height = vim.fn.winheight(0)
	local so = vim.wo.scrolloff or vim.o.scrolloff or 0

	-- Se estiver na região de perigo inferior (menos de 'so' linhas do fundo)
	if cursor_winline >= win_height - so then
		vim.cmd("normal! zz") -- centraliza também ignorando mapeamentos
	end
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

vim.keymap.set("n", "<C-h", vim.cmd.wincmd({ args = { "h" } }))
vim.keymap.set("n", "<C-j", vim.cmd.wincmd({ args = { "j" } }))
vim.keymap.set("n", "<C-k", vim.cmd.wincmd({ args = { "k" } }))
vim.keymap.set("n", "<C-l", vim.cmd.wincmd({ args = { "l" } }))

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "j", function()
	move_and_center_if_at_bottom("j")
end)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<Leader>w", function()
	require("conform").format({ bufnr = 0 })
	vim.cmd("write")
end)

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

-- Jump to next item in location list and center the screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Jump to previous item in location list and center the screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace the word under cursor (with confirmation/editing)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
