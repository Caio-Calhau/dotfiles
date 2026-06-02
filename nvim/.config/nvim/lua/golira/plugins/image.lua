return {
	{
		"3rd/image.nvim",
		lazy = true,
		ft = { "markdown", "vimwiki" },
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" },
				},
			},
			max_width = 100,
			max_height = 20,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			tmux_show_only_in_active_window = true,
		},
	},
}
