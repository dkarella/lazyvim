-- https://www.lazyvim.org/extras/coding/blink
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- https://cmp.saghen.dev/configuration/keymap.html
      preset = "super-tab",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
