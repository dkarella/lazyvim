return {
  "snacks.nvim",
  opts = {
    scroll = { enabled = false },
    terminal = {
      win = {
        position = "right",
        width = 0.50,
        wo = {
          winbar = "",
        },
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
