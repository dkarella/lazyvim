return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rouge8/neotest-rust",
		"fredrikaverpil/neotest-golang",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rust"),
				require("neotest-golang")({
					experimental = {
						testify_suites = true,
					},
					go_test_args = { "-v", "-race", "-count=1", "-tags=unit,integration" },
				}),
			},
			discovery = {
				enabled = false,
			},
		})
	end,
	keys = {
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Test run nearest",
		},
		{
			"<leader>tt",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Test run file",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Test summary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, last_run = false })
			end,
			desc = "Test output (cursor)",
		},
	},
}
