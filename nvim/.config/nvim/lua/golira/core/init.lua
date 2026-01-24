require("golira.core.set")
require("golira.core.remap")

local augroup = vim.api.nvim_create_augroup
local GoliraGroup = augroup("Golira", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "Visual",
			timeout = 100,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = GoliraGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = GoliraGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
