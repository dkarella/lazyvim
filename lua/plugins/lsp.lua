return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },

      servers = {
        ["rust-analyzer"] = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
            },
          },
        },

        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=unit,integration" },
            },
          },
        },
      },
    },
  },
}
