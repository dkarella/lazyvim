return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rust"),
        require("neotest-go")({
          args = { "-tags=unit,integration" },
        }),
      },
    })
  end,
  keys = {
    { "<leader>tr", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test run file" },
    { "<leader>tt", function() require("neotest").run.run() end,                  desc = "Test nearest" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,           desc = "Test summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
  },
}
