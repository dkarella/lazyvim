-- Standalone-only keymaps (VS Code handles splits via its own commands)
local map = vim.keymap.set

map('n', '|', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '\\', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Close Window', remap = true })
map('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = 'Delete Buffer' })
