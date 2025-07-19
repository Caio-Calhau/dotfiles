return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"},

    config = function()
      local harpoon = require("harpoon")
      local conf  = require("telescope.config")

      harpoon.setup({})
      -- basic telescope configuration
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-A-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-A-N>", function() harpoon:list():next() end)
    end
}
