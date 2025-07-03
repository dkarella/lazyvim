return {
  "nvim-neotest/neotest",
  dependencies = {
    "fredrikaverpil/neotest-golang",
    "mrcjkb/rustaceanvim",
    "nvim-neotest/nvim-nio",
  },
  opts = {
    -- See all config options with :h neotest.Config
    discovery = {
      -- Drastically improve performance in ginormous projects by
      -- only AST-parsing the currently opened buffer.
      enabled = false,
      -- Number of workers to parse files concurrently.
      -- A value of 0 automatically assigns number based on CPU.
      -- Set to 1 if experiencing lag.
      concurrent = 1,
    },
    running = {
      -- Run tests concurrently when an adapter provides multiple commands to run.
      concurrent = true,
    },
    summary = {
      -- Enable/disable animation of icons.
      animated = false,
    },

    adapters = {
      ["neotest-golang"] = {
        go_test_args = { "-v", "-race", "-count=1", "-timeout=30s" },
        testify_enabled = true,
        dap_go_enabled = true,
      },
      ["rustaceanvim.neotest"] = {},
    },
  },
}
