return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		diagnostics = true,
		right = function()
			local result = {}
			local seve = vim.diagnostic.severity
			local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
			local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
			local info = #vim.diagnostic.get(0, { severity = seve.INFO })
			local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

			if error ~= 0 then
				table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
			end

			if warning ~= 0 then
				table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
			end

			if hint ~= 0 then
				table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
			end

			if info ~= 0 then
				table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
			end
			return result
		end,

		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					show_buffer_close_icons = false,
					separator_style = { "", "" },
					always_show_bufferline = true,
					style_preset = bufferline.style_preset.no_italic,
					numbers = function(opts)
						return string.format("%s", opts.ordinal)
					end,
					custom_filter = function(buf_number)
						-- filter out filetypes you don't want to see
						if vim.bo[buf_number].filetype ~= "qf" then
							return true
						end
					end,
					offsets = {
						{
							filetype = "snacks_layout_box",
							text = "",
							highlight = "EcovimNvimTreeTitle",
							text_align = "center",
							separator = false,
						},
					},
				},
			})
		end,
		keys = {
			{ "<Leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Close Right" },
			{ "<Leader>bn", "<cmd>BufferLineMoveNext<CR>", desc = "Move next" },
			{ "<Leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Left" },
			{ "<Leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
			{ "<Leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Pin/Unpin Buffer" },
			{ "<Leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },
			{ "<Leader>bse", "<cmd>BufferLineSortByExtension<CR>", desc = "Sort by extension" },
			{ "<Leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>", desc = "Sort by relative dir" },
			{ "<A-,>", "<cmd>bprevious<CR>", desc = "Previous" },
			{ "<A-.>", "<cmd>bnext<CR>", desc = "Next" },
		},
	},
}
