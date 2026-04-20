-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

local specs = {
  { import = 'shared.plugins' }, -- shared plugins (load in both)
}
if vim.g.vscode then
  -- vscode-only plugin specs would go here (currently none)
else
  table.insert(specs, { import = 'nvim.plugins' })
end

require('lazy').setup(specs, {
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = { 'gzip', 'tarPlugin', 'tohtml', 'tutor', 'zipPlugin' },
    },
  },
})
