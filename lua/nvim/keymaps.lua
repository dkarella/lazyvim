-- Standalone-only keymaps (VS Code handles splits via its own commands)
local map = vim.keymap.set

map('n', '|', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '\\', '<C-W>v', { desc = 'Split Window Right', remap = true })
