-- Which-key: keymap hints
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    icons = { mappings = false },
    spec = {
      { '<leader>b', group = 'buffer' },
      { '<leader>l', group = 'tools' },
      { '<leader>u', group = 'ui' },
    },
  },
}
