-- Restore the last session for the current directory when nvim starts with no arguments
return {
  "folke/persistence.nvim",
  init = function()
    vim.api.nvim_create_autocmd("StdinReadPre", {
      callback = function()
        vim.g.started_with_stdin = true
      end,
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      nested = true,
      callback = function()
        if vim.fn.argc(-1) == 0 and not vim.g.started_with_stdin then
          require("persistence").load()
        end
      end,
    })
  end,
}
