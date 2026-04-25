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

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = vim.api.nvim_create_augroup('auto-checktime', { clear = true }),
  callback = function()
    if vim.fn.mode() ~= 'c' and vim.fn.getcmdwintype() == '' then
      vim.cmd('checktime')
    end
  end,
})

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = vim.api.nvim_create_augroup('auto-reload-notify', { clear = true }),
  callback = function()
    vim.notify('File changed on disk, buffer reloaded', vim.log.levels.INFO)
  end,
})
