-- https://www.lazyvim.org/extras/coding/blink
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- https://cmp.saghen.dev/configuration/keymap.html
      -- preset = "super-tab", -- TODO: @danny revert this when the following is merged:
      -- https://github.com/LazyVim/LazyVim/pull/6183
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
