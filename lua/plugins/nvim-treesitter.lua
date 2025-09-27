return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "rust",
      "go",
      "lua",
    },
  },
  auto_install = true,
}
