-- Smart word motions: W/E/B are camelCase & snake_case aware
-- Useful in both standalone and VSCode
return {
  'chrisgrieser/nvim-spider',
  lazy = false,
  config = function()
    vim.keymap.set({ 'n', 'o', 'x' }, 'W', function() require('spider').motion('w') end, { desc = 'Spider-w' })
    vim.keymap.set({ 'n', 'o', 'x' }, 'E', function() require('spider').motion('e') end, { desc = 'Spider-e' })
    vim.keymap.set({ 'n', 'o', 'x' }, 'B', function() require('spider').motion('b') end, { desc = 'Spider-b' })
  end,
}
