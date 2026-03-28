return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    terminal = {
      win = {
        style = "float",
        wo = {
          winbar = "",
        },
        border = "rounded",
        width = 0.9,
        height = 0.9,
      },
    },
    explorer = {
      hidden = true,
    },
    picker = {
      sources = {
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
