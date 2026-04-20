-- Highlight TODO, NOTE, FIXME, HACK, WARN, PERF comments
return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { ']t',         function() require('todo-comments').jump_next() end, desc = 'Next Todo Comment' },
    { '[t',         function() require('todo-comments').jump_prev() end, desc = 'Prev Todo Comment' },
    { '<leader>st', '<cmd>TodoQuickFix<cr>',                              desc = 'Todo (quickfix)' },
  },
}
