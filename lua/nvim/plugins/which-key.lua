-- Which-key: keymap hints
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    icons = { mappings = false },
    spec = {
      { '<leader>b', group = 'buffer' },
      { '<leader>c', group = 'code' },
      { '<leader>h', group = 'hunks (git)' },
      { '<leader>l', group = 'tools' },
      { '<leader>r', group = 'rename' },
      { '<leader>u', group = 'ui' },
    },
  },
}
