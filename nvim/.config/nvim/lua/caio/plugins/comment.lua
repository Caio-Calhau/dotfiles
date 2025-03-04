return {
  'numToStr/Comment.nvim',
  
  event = { "BufReadPre", "BufNewFile" },
  
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },

  config = function()
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    require('Comment').setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
      },
      opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
      },
    })
  end
}
