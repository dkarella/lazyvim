return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      width = "full",
      border = true,
    },
    code = {
      width = "block",
      right_pad = 1,
      border = "thick",
      language_icon = true,
      language_name = true,
    },
    checkbox = {
      enabled = true,
    },
    bullet = {
      icons = { "●", "○", "◆", "◇" },
    },
    pipe_table = {
      border = { "╭", "┬", "╮", "├", "┼", "┤", "╰", "┴", "╯", "│", "─" },
    },
    link = {
      enabled = true,
    },
    quote = {
      repeat_linebreak = true,
    },
  },
}
