-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Windows
map("n", "|", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "\\", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Buffers
map("n", "<leader>bn", function()
  local rel = vim.fn.expand("%")

  local fname = rel
  for token in rel.gmatch(rel, "[^/]+") do
    fname = token
  end

  vim.fn.setreg("+", fname)
end, { desc = "copy current buffer file name to clipboard" })

map("n", "<leader>bp", function()
  local rel = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
  vim.fn.setreg("+", rel)
end, { desc = "copy current buffer relative path to clipboard" })

map("n", "<leader>bP", function()
  local abs = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg("+", abs)
end, { desc = "copy current buffer absolute path to clipboard" })

map("n", "<leader>dn", function()
  local abs = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg("+", abs)
end, { desc = "copy current buffer absolute path to clipboard" })

-- Terminal
map("t", "<C-x>", [[<C-\><C-n>]], { desc = "Enter normal mode in terminal window" })

-- DAP
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Continue" })

map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step Over" })

map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step Into" })

map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Step Out" })

map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step Over" })

-- Insert macros
map("i", "<C-t>", function()
  vim.api.nvim_put({ "// TODO: @danny " }, "c", true, true)
end, { desc = "Insert TODO" })

map("i", "<C-n>", function()
  vim.api.nvim_put({ "// NOTE: @danny " }, "c", true, true)
end, { desc = "Insert NOTE" })
