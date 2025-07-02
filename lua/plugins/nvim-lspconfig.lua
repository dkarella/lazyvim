return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },

    ["rust-analyzer"] = {
      settings = {
        ["rust-analyzer"] = {
          procMacro = { enable = true },
        },
      },
    },
  },
}
