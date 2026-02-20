-- https://www.lazyvim.org/extras/coding/blink
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- https://cmp.saghen.dev/configuration/keymap.html
      preset = "super-tab",
      ["<Tab>"] = {
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            suggestion.accept()
            return true
          end
        end,
        "snippet_forward",
        "select_next",
        "fallback",
      },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
