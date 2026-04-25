-- Shared keymaps — load in both standalone and vscode-neovim
local map = vim.keymap.set

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Focus Left Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus Right Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus Below Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus Above Window' })

-- Function navigation (uses Vim built-in [m / ]m under the hood)
map('n', '[f', '[m', { desc = 'Previous function' })
map('n', ']f', ']m', { desc = 'Next function' })

-- Buffers — copy path/name to clipboard
map('n', '<leader>bn', function()
  local rel = vim.fn.expand('%')
  local fname = rel
  for token in rel.gmatch(rel, '[^/]+') do
    fname = token
  end
  vim.fn.setreg('+', fname)
end, { desc = 'Copy buffer file name to clipboard' })

map('n', '<leader>bp', function()
  local rel = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
  vim.fn.setreg('+', rel)
end, { desc = 'Copy buffer relative path to clipboard' })

map('n', '<leader>bP', function()
  local abs = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg('+', abs)
end, { desc = 'Copy buffer absolute path to clipboard' })

-- Terminal: escape to normal mode
map('t', '<C-x>', [[<C-\><C-n>]], { desc = 'Enter normal mode in terminal' })

-- Insert macros
map('i', '<C-t>', function()
  vim.api.nvim_put({ '// TODO: @danny ' }, 'c', true, true)
end, { desc = 'Insert TODO comment' })

map('i', '<C-n>', function()
  vim.api.nvim_put({ '// NOTE: @danny ' }, 'c', true, true)
end, { desc = 'Insert NOTE comment' })

-- Quit
map('n', '<leader>qq', '<cmd>qa!<CR>', { desc = 'Force quit Neovim' }) 

-- Clear search highlight on <Esc>
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
