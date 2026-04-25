-- Conform: format on save via external formatters
-- goimports: gofmt + organize imports
-- rustfmt:   rust formatter (ships with the rust toolchain)
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
      mode = { 'n', 'v' },
      desc = 'Format Buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      go = { 'goimports', 'gofmt' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      lua = { 'stylua' },
    },
    format_on_save = function(bufnr)
      if vim.b[bufnr].autoformat == false then
        return
      end
      return { timeout_ms = 2000, lsp_format = 'fallback' }
    end,
  },
}
