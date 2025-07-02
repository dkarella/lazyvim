-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- Disable autoformat on save for YAML and JSON files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "json", "jsonc" },
  callback = function()
    vim.b.autoformat = false
  end,
})
