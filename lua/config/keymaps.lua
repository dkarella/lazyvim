-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>|", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

map("n", "<leader>bn", function()
  local rel = vim.fn.expand("%")

  local fname = rel
  for token in rel.gmatch(rel, "[^/]+") do
    fname = token
  end

  vim.fn.setreg("+", fname)
end, { desc = "copy current buffer file name to clipboard" })

map("n", "<leader>bp", function()
  local rel = vim.fn.expand("%")
  vim.fn.setreg("+", rel)
end, { desc = "copy current buffer relative path to clipboard" })

map("n", "<leader>bP", function()
  local abs = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg("+", abs)
end, { desc = "copy current buffer absolute path to clipboard" })
