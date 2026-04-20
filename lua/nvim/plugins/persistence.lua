-- Session persistence: auto-save on exit, auto-restore when nvim is launched
-- with no file args, manual restore via keymaps.
return {
  'folke/persistence.nvim',
  lazy = false,
  opts = {},
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('persistence_autoload', { clear = true }),
      nested = true,
      callback = function()
        if vim.fn.argc() == 0 and vim.g.started_with_stdin ~= 1 then
          -- Defer so lazy.nvim finishes its VimEnter pass and lazy-loaded
          -- plugins (LSP, treesitter FileType hooks) are wired before
          -- buffers are restored.
          vim.schedule(function() require('persistence').load() end)
        end
      end,
    })
    vim.api.nvim_create_autocmd('StdinReadPre', {
      callback = function() vim.g.started_with_stdin = 1 end,
    })
  end,
  keys = {
    { '<leader>qs', function() require('persistence').load() end,                desc = 'Restore Session' },
    { '<leader>ql', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
    { '<leader>qd', function() require('persistence').stop() end,                desc = "Don't Save Current Session" },
  },
}
