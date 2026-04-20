-- Disable autoformat for YAML/JSON (no formatter configured here,
-- but keeping for parity if one is added later)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'json', 'jsonc' },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
