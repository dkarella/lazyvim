-- Treesitter: parser management + syntax highlighting
-- nvim-treesitter v2 removed the `configs` module; highlighting goes through
-- Neovim's built-in vim.treesitter API. The plugin handles parsers only.
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- Auto-enable treesitter highlighting per filetype
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
