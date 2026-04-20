-- LSP: Mason + nvim-lspconfig
-- Servers: rust-analyzer (Rust), gopls (Go)
return {
  {
    'mason-org/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate', 'MasonLog' },
    opts = {},
  },
  {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = { 'rust_analyzer', 'gopls' },
      -- v2 default: automatically calls vim.lsp.enable for each installed server
      automatic_enable = true,
    },
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)

      -- Buffer-local LSP keymaps, wired on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach-keymaps', { clear = true }),
        callback = function(ev)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
          end
          map('n', 'gd',         vim.lsp.buf.definition,      'Go to Definition')
          map('n', 'gD',         vim.lsp.buf.declaration,     'Go to Declaration')
          map('n', 'gr',         vim.lsp.buf.references,      'Go to References')
          map('n', 'gI',         vim.lsp.buf.implementation,  'Go to Implementation')
          map('n', 'gy',         vim.lsp.buf.type_definition, 'Go to Type Definition')
          map('n', 'K',          vim.lsp.buf.hover,           'Hover')
          map('n', '<leader>rn', vim.lsp.buf.rename,          'Rename Symbol')
          map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, 'Code Action')
          map('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, 'Format Buffer')
          map('n', '[d',         function() vim.diagnostic.jump({ count = -1 }) end, 'Prev Diagnostic')
          map('n', ']d',         function() vim.diagnostic.jump({ count = 1 }) end,  'Next Diagnostic')
          map('n', '<leader>cd', vim.diagnostic.open_float,   'Line Diagnostics')
        end,
      })
    end,
  },
}
