-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- When in insert mode
-- use jk to exit insert mode
keymap.set("i", "C-c", "<ESC>", { desc = "Exit insert mode with jk" })
-- Navigation in Insert Mode (Ctrl + hjkl like arrow keys)
keymap.set("i", "<A-h>", "<Left>", { desc = "Move left in insert mode" })
keymap.set("i", "<A-j>", "<Down>", { desc = "Move down in insert mode" })
keymap.set("i", "<A-k>", "<Up>", { desc = "Move up in insert mode" })
keymap.set("i", "<A-l>", "<Right>", { desc = "Move right in insert mode" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "J", "5j", { desc = "5 lines down" })
keymap.set("n", "K", "5k", { desc = "5 lines up" })
keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", '<Leader>e', '<cmd>Explore<CR>', {desc = 'Open explorer'})
keymap.set("n", "A-z", ":set wrap!<CR>", { desc = "Toggle line wrapping" })
keymap.set("n", "<Leader>q", ":q<CR>", { desc = "Quit command" })
keymap.set("n", "<CR>", ":put ='' <CR>", { noremap = true, silent = true })

keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "<Tab>", ">gv", { desc = "Indent selected code" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent selected code" })

