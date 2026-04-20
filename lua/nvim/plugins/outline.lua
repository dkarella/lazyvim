-- Code symbols outline in a right-side panel
return {
  'hedyhli/outline.nvim',
  cmd = { 'Outline', 'OutlineOpen' },
  keys = {
    { '<leader>cs', '<cmd>Outline<cr>', desc = 'Toggle Symbols Outline' },
  },
  opts = {
    outline_window = {
      position = 'right',
      width = 45,
      relative_width = false,
      auto_close = false,
      auto_jump = false,
      show_numbers = false,
      show_relative_numbers = false,
      wrap = false,
    },
    symbol_folding = {
      autofold_depth = 1,
      auto_unfold = { hovered = true },
    },
  },
}
