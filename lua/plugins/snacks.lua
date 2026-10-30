return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    terminal = {
      win = {
        position = "bottom",
        height = 0.4,
        wo = {
          winbar = "",
        },
      },
    },
    lazygit = {
      win = {
        position = "float",
        border = "rounded",
        width = 0.9,
        height = 0.9,
      },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
      },
    },
  },
}
